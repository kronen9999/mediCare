import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/components/cuidadores/home/item_lista_recordatoriosProximos.dart';
import 'package:medicare/models/cuidadores/home/cuidadores_obtenerproximosrecordatorios.dart';
import 'package:medicare/models/cuidadores/home/cuidadores_sabercuidadorasignado.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidador/home/cuidador_chat_ia_personalizada_screen.dart';
import 'package:medicare/screens/cuidador/home/cuidador_chat_ia_widget.dart';
import 'package:medicare/screens/cuidador/home/cuidador_historial_recordatorios_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medicare/main.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Cuidadorprincipalscreen extends StatefulWidget {
  const Cuidadorprincipalscreen({super.key});

  @override
  State<Cuidadorprincipalscreen> createState() =>
      _CuidadorprincipalscreenState();
}

class _CuidadorprincipalscreenState extends State<Cuidadorprincipalscreen>
    with TickerProviderStateMixin {
  String cuidadorAsignado = "En espera";
  String? nombreP = "";
  String? apellidoP = "";
  String? apellidoM = "";
  String? telefono1 = "";
  String? telefono2 = "";
  String? padecimiento = "";
  String? direccion = "";
  late final AnimationController _controller = AnimationController(vsync: this);
  late final AnimationController _controllerNoWifi;
  String? idCuidador;
  String? tokenAcceso;
  late final AnimationController _controllerEmpty = AnimationController(
    vsync: this,
  );
  late final AnimationController _controllerWarning = AnimationController(
    vsync: this,
  );
  String seccion = "default";
  Future<CuidadoresObtenerproximosrecordatoriosResponse?>? listaRecordatorios;

  @override
  void initState() {
    super.initState();
    _controller.duration = const Duration(seconds: 10);
    _controllerNoWifi = AnimationController(vsync: this);
    _controllerEmpty.duration = const Duration(seconds: 2);
    _controllerNoWifi.duration = const Duration(seconds: 2);
    _controllerWarning.duration = const Duration(seconds: 2);
    obtenerDatosSesion();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerNoWifi.dispose();
    _controllerEmpty.dispose();
    _controllerWarning.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: seccion == "chatbot"
          ? null
          : seccion == "historialrecordatorios"
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  seccion = "chatbot";
                });
              },
              backgroundColor: const Color.fromARGB(255, 28, 177, 22),
              child: Icon(Icons.chat_bubble_outline, color: Colors.white),
            ),
      body: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: seccion == "default"
              ? principal()
              : seccion == "historialrecordatorios"
              ? CuidadorHistorialRecordatoriosScreen(
                  idCuidador: idCuidador,
                  tokenAcceso: tokenAcceso,
                  onSelect: asignarSeccion,
                )
              : seccion == "chatbot"
              ? CuidadorChatIaPersonalizadaScreen(
                  idCuidador: idCuidador,
                  onSelect: asignarSeccion,
                )
              : Text("Otra pantalla"),
        ),
      ),
    );
  }

  SingleChildScrollView principal() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Lottie.asset(
              frameRate: FrameRate.max,
              repeat: true,
              reverse: true,
              'assets/images/homec.json',
              controller: _controller,
              width: 250,
              height: 200,
              fit: BoxFit.fill,
              onLoaded: (composition) {
                if (mounted) {
                  _controller.repeat();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Bienvenido",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Adminstra los recordatorios de tus seres queridos",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          cuidadorAsignado == "Asignado"
              ? apartadoAsignado()
              : cuidadorAsignado == "No Asignado"
              ? apartadoNoAsignado()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: CircularProgressIndicator(color: Colors.green),
                  ),
                ),
        ],
      ),
    );
  }

  Column apartadoAsignado() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
              onPressed: () {
                asignarSeccion("historialrecordatorios");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.history, color: Colors.white, size: 20),
                  Text(
                    "Historial de recordatorios",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(221, 214, 212, 212),
                  spreadRadius: .5,
                  blurRadius: 8,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: .5),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(113, 165, 214, 167),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  Icons.person_outline_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: 250,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Paciente Asignado",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Informacion del paciente asignado",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 15,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Nombre Completo",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "$nombreP $apellidoP $apellidoM",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.person_pin_circle_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Direccion",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "$direccion",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.medical_information_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Padecimiento",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "$padecimiento",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Telefono principal",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "$telefono1",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Telefono secundario",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "$telefono2",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "Proximos recordatorios",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: FutureBuilder<CuidadoresObtenerproximosrecordatoriosResponse?>(
            future: listaRecordatorios,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Lottie.asset(
                          repeat: true,
                          reverse: true,
                          'assets/images/wifierror.json',
                          controller: _controllerNoWifi,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                          onLoaded: (composition) {
                            _controllerNoWifi.duration = composition.duration;
                            _controllerNoWifi.forward();
                          },
                        ),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        "Parece que su conexión está lenta o inestable.",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 180,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              204,
                              57,
                              46,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            obtenerListaRecordatorios(
                              idCuidador ?? "",
                              tokenAcceso ?? "",
                            );
                          },
                          icon: Icon(Icons.refresh, color: Colors.white),
                          label: Text(
                            "Reintentar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (!snapshot.hasData ||
                  snapshot.data?.recordatorios == null ||
                  snapshot.data!.recordatorios.isEmpty) {
                _controllerEmpty.reset();
                _controllerEmpty.forward();
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Lottie.asset(
                        repeat: true,
                        reverse: true,
                        'assets/images/nodatagreen.json',
                        controller: _controllerEmpty,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitWidth,
                        onLoaded: (composition) {
                          _controllerEmpty.duration = composition.duration;
                          _controllerEmpty.forward();
                        },
                      ),
                      Text(
                        "Sin recordatorios pendientes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 13, 44, 70),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }
              final recordatorios = snapshot.data!.recordatorios;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: recordatorios.length,
                itemBuilder: (context, index) {
                  final recordatorio = recordatorios[index];

                  return ItemListaRecordatoriosproximos(
                    idCuidador: idCuidador,
                    tokenAcceso: tokenAcceso,
                    idHistorial: recordatorio.idHistorial.toString(),
                    nombreM: recordatorio.nombreM,
                    nombreP: recordatorio.nombreP,
                    dosis: recordatorio.dosis,
                    unidadDosis: recordatorio.unidadDosis,
                    notas: recordatorio.notas,
                    fechaAdministracion: formatearFecha(
                      recordatorio.fechaProgramada,
                    ),
                    onUpdateRecordatorios: obtenerListaRecordatorios,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Column apartadoNoAsignado() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Lottie.asset(
            repeat: true,
            reverse: true,
            'assets/images/warning.json',
            controller: _controllerEmpty,
            width: 150,
            height: 150,
            fit: BoxFit.fitWidth,
            onLoaded: (composition) {
              _controllerEmpty.duration = composition.duration;
              _controllerEmpty.forward();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            "Lo sentimos pero tu administrador no te ha asignado un familiar,te sugerimos contactar con el para que pueda asignarte uno.",
            style: TextStyle(
              color: const Color.fromARGB(255, 34, 82, 36),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void obtenerListaRecordatorios(String idCuidador, String tokenAcceso) async {
    try {
      final repo = CuidadoresRepositoryGlobal();
      setState(() {
        listaRecordatorios = repo.obtenerProximosRecordatorios(
          CuidadoresObtenerproximosrecordatorios(
            idCuidador: idCuidador,
            tokenAcceso: tokenAcceso,
          ),
        );
      });
      final recordatorios = await listaRecordatorios;
      if (!mounted) return;
      if (recordatorios != null && recordatorios.recordatorios.isNotEmpty) {
        for (var recordatorio in recordatorios.recordatorios) {
          agregarNotificacion(
            recordatorio.idHistorial,
            recordatorio.nombreM,
            recordatorio.nombreP,
            recordatorio.fechaProgramada,
          );
        }
      }
    } catch (e) {
      print("Error al obtener los recordatorios: $e");
    }
  }

  void saberPacienteAsignado(String idCuidador, String tokenAcceso) async {
    try {
      final repo = CuidadoresRepositoryGlobal();
      final result = await repo.saberPacienteAsignado(
        CuidadoresSabercuidadorasignado(
          idCuidador: idCuidador,
          tokenAcceso: tokenAcceso,
        ),
      );
      if (!mounted) return;
      setState(() {
        cuidadorAsignado = result.message.toString();
        nombreP = result.nombre;
        apellidoP = result.apellidoP;
        apellidoM = result.apellidoM;
        telefono1 = result.telefono1;
        telefono2 = result.telefono2;
        padecimiento = result.padecimiento;
        direccion = result.direccion;
      });
      if (result.message == "Asignado") {
        obtenerListaRecordatorios(idCuidador, tokenAcceso);
      }
    } catch (e) {
      if (!mounted) return;
      saberPacienteAsignado(idCuidador, tokenAcceso);
    }
  }

  void obtenerDatosSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idCuidador = prefs.getString('IdCuidador');
      tokenAcceso = prefs.getString('TokenAcceso');
    });
    saberPacienteAsignado(idCuidador ?? "", tokenAcceso ?? "");
  }

  void asignarSeccion(String nuevaSeccion) {
    setState(() {
      seccion = nuevaSeccion;
    });
  }

  String formatearFecha(String fechaSinFormato) {
    DateTime fecha = DateTime.parse(fechaSinFormato.replaceFirst(' ', 'T'));
    const meses = [
      '',
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    String periodo = fecha.hour < 12 ? 'AM' : 'PM';
    int hora12 = fecha.hour % 12 == 0 ? 12 : fecha.hour % 12;
    String minutos = fecha.minute.toString().padLeft(2, '0');
    return '${fecha.day} de ${meses[fecha.month]} a las $hora12:$minutos $periodo';
  }

  Future<void> agregarNotificacion(
    int idHistorial,
    String nombreMedicamento,
    String nombrePaciente,
    String horaRecordatorio,
  ) async {
    final fechaActual = tz.TZDateTime.now(tz.local);
    final fechaNotificacion = DateTime.parse(horaRecordatorio);

    final tzFechaNotificacion = tz.TZDateTime.from(fechaNotificacion, tz.local);

    if (tzFechaNotificacion.isBefore(fechaActual)) {
      return;
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      idHistorial,
      "Es hora de suministrar {$nombreMedicamento}",
      "Es hora de dar el medicamento a $nombrePaciente",
      tz.TZDateTime.parse(tz.local, horaRecordatorio),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'medicare_channel_01',
          'Recordatorios',
          channelDescription: 'Canal para recordatorios de medicamentos',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
