import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/components/familiares/familiar_principal_screen/item_lista_recordatoriosProximos.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_obtenerproximosrecordatorios.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
//import 'package:medicare/screens/familiar/Inicio/familiar_chat_ia_widget.dart';
import 'package:medicare/screens/familiar/Inicio/familiar_chat_iapersonalizada.dart';
import 'package:medicare/screens/familiar/Inicio/familiar_historial_recordatorios_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicare/main.dart';

class FamiliarPrincipalScreen extends StatefulWidget {
  const FamiliarPrincipalScreen({super.key});

  @override
  State<FamiliarPrincipalScreen> createState() =>
      _FamiliarPrincipalScreenState();
}

class _FamiliarPrincipalScreenState extends State<FamiliarPrincipalScreen>
    with TickerProviderStateMixin {
  Future<FamiliaresPacientesObtenerproximosrecordatoriosResponse?>?
  listaRecordatorios;

  String? idFamiliar;
  String? tokenAcceso;
  String tipoScreen = "default";
  late final AnimationController _controller;
  late final AnimationController _controllerNoWifi;
  late final AnimationController _controllerEmpty = AnimationController(
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    obtenerDatos();
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(seconds: 2);
    _controllerNoWifi = AnimationController(vsync: this);
    _controllerNoWifi.duration = Duration(seconds: 2);
    _controllerEmpty.duration = Duration(seconds: 2);
    obtenerProximosRecordatorios();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerNoWifi.dispose();
    _controllerEmpty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: tipoScreen == "chatbot"
          ? null
          : tipoScreen == "historialrecordatorios"
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  tipoScreen = "chatbot";
                });
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.chat_bubble_outline, color: Colors.white),
            ),
      body: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: tipoScreen == "default"
              ? SingleChildScrollView(child: cuerpoPrincipal())
              : tipoScreen == "chatbot"
              ? FamiliarChatIapersonalizada(
                  idFamiliar: idFamiliar,
                  onSelect: asignarSeccion,
                )
              : tipoScreen == "historialrecordatorios"
              ? FamiliarHistorialRecordatoriosScreen(
                  idFamiliar: idFamiliar,
                  tokenAcceso: tokenAcceso,
                  onSelect: asignarSeccion,
                )
              : Text("Otra pantalla"),
        ),
      ),
    );
  }

  void asignarSeccion(String nuevoValor) {
    setState(() {
      if (mounted) {
        _controller.reset();
        _controller.forward();
        _controllerNoWifi.reset();
        _controllerNoWifi.forward();
      }
      tipoScreen = nuevoValor;
    });
  }

  void obtenerDatos() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    setState(() {
      idFamiliar = prefs.getString("IdUsuario");
      tokenAcceso = prefs.getString("TokenAcceso");
    });
  }

  Column cuerpoPrincipal() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Lottie.asset(
          repeat: true,
          reverse: true,
          'assets/images/heartanimated.json',
          controller: _controller,
          width: 250,
          height: 200,
          fit: BoxFit.fill,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
            _controller.forward();
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          "Bienvenido",
          style: TextStyle(
            color: Color.fromRGBO(85, 150, 255, 1),
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
      Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
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
      ElevatedButton(
        onPressed: () async {
          await flutterLocalNotificationsPlugin.show(
            2001,
            'Notificación inmediata',
            'Si ves esto, el canal funciona',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'test_channel_immediate',
                'Pruebas Inmediatas',
                importance: Importance.max,
                priority: Priority.high,
              ),
            ),
          );
        },
        child: Text("Notificacion de prueba"),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            "Proximos recordatorios",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child:
            FutureBuilder<
              FamiliaresPacientesObtenerproximosrecordatoriosResponse?
            >(
              future: listaRecordatorios,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blue),
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
                              obtenerProximosRecordatorios();
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
                          'assets/images/empty.json',
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
                      idFamiliar: idFamiliar,
                      tokenAcceso: tokenAcceso,
                      idHistorial: recordatorio.idHistorial.toString(),
                      nombreM: recordatorio.nombreM,
                      nombreP: recordatorio.nombreP,
                      nombreC: recordatorio.nombreCuidador,
                      dosis: recordatorio.dosis,
                      unidadDosis: recordatorio.unidadDosis,
                      notas: recordatorio.notas,
                      fechaAdministracion: formatearFecha(
                        recordatorio.fechaProgramada,
                      ),
                      onUpdateMedicamentos: obtenerProximosRecordatorios,
                    );
                  },
                );
              },
            ),
      ),
    ],
  );

  void obtenerProximosRecordatorios() async {
    final repo = FamiliaresReposotoryGlobal();
    final prefs = await SharedPreferences.getInstance();
    try {
      if (!mounted) {
        return;
      }
      setState(() {
        listaRecordatorios = repo.obtenerProximosRecordatorios(
          FamiliaresPacientesObtenerproximosrecordatorios(
            idFamiliar: prefs.getString("IdUsuario") ?? "",
            tokenAcceso: prefs.getString("TokenAcceso") ?? "",
          ),
        );
      });
    } catch (e) {
      if (!mounted) {
        return;
      }
      obtenerProximosRecordatorios();
    }
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
}
