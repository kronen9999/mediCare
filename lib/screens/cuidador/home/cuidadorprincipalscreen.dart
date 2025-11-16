import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/components/cuidadores/home/item_lista_recordatoriosProximos.dart';
import 'package:medicare/models/cuidadores/home/cuidadores_obtenerproximosrecordatorios.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidador/home/cuidador_chat_ia_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cuidadorprincipalscreen extends StatefulWidget {
  const Cuidadorprincipalscreen({super.key});

  @override
  State<Cuidadorprincipalscreen> createState() =>
      _CuidadorprincipalscreenState();
}

class _CuidadorprincipalscreenState extends State<Cuidadorprincipalscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _controllerNoWifi;
  String? idCuidador;
  String? tokenAcceso;
  late final AnimationController _controllerEmpty = AnimationController(
    vsync: this,
  );
  String seccion = "default";
  Future<CuidadoresObtenerproximosrecordatoriosResponse?>? listaRecordatorios;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controllerNoWifi = AnimationController(vsync: this);
    _controllerEmpty.duration = const Duration(seconds: 2);
    _controllerNoWifi.duration = const Duration(seconds: 2);
    obtenerDatosSesion();
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
      floatingActionButton: seccion == "chatbot"
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
              : seccion == "chatbot"
              ? CuidadorChatIaWidget(onSelect: asignarSeccion)
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
              repeat: true,
              reverse: true,
              'assets/images/healtgreen.json',
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
            padding: const EdgeInsets.only(left: 25, right: 25),
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
            child:
                FutureBuilder<CuidadoresObtenerproximosrecordatoriosResponse?>(
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
                            Text(snapshot.error.toString()),
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
                                  _controllerNoWifi.duration =
                                      composition.duration;
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
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
                                _controllerEmpty.duration =
                                    composition.duration;
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
      ),
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
    } catch (e) {
      print(e.toString());
    }
  }

  void obtenerDatosSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idCuidador = prefs.getString('IdCuidador');
      tokenAcceso = prefs.getString('TokenAcceso');
    });
    obtenerListaRecordatorios(idCuidador ?? "", tokenAcceso ?? "");
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
}
