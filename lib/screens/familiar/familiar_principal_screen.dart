import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/components/familiares/familiar_principal_screen/item_lista_recordatoriosProximos.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_obtenerproximosrecordatorios.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
//import 'package:medicare/screens/familiar/Inicio/familiar_chat_ia_widget.dart';
import 'package:medicare/screens/familiar/Inicio/familiar_chat_iapersonalizada.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamiliarPrincipalScreen extends StatefulWidget {
  const FamiliarPrincipalScreen({super.key});

  @override
  State<FamiliarPrincipalScreen> createState() =>
      _FamiliarPrincipalScreenState();
}

class _FamiliarPrincipalScreenState extends State<FamiliarPrincipalScreen>
    with SingleTickerProviderStateMixin {
  Future<FamiliaresPacientesObtenerproximosrecordatoriosResponse?>?
  listaRecordatorios;

  String? idFamiliar;
  String? tokenAcceso;
  String tipoScreen = "default";
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    obtenerDatos();
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(seconds: 2);
    obtenerProximosRecordatorios();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: tipoScreen == "chatbot"
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
                ) //FamiliarChatIaWidget()
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
            onPressed: () {},
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
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error al cargar los recordatorios'),
                  );
                }
                if (!snapshot.hasData ||
                    snapshot.data?.recordatorios == null ||
                    snapshot.data!.recordatorios.isEmpty) {
                  return Center(child: Text('No hay próximos recordatorios'));
                }
                final recordatorios = snapshot.data!.recordatorios;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recordatorios.length,
                  itemBuilder: (context, index) {
                    final recordatorio = recordatorios[index];

                    return ItemListaRecordatoriosproximos(
                      idMedicamento: recordatorio.idHistorial.toString(),
                      nombreM: recordatorio.nombreM,
                      nombreP: recordatorio.nombreP,
                      nombreC: recordatorio.nombreCuidador,
                      dosis: recordatorio.dosis,
                      unidadDosis: recordatorio.unidadDosis,
                      notas: recordatorio.notas,
                      fechaAdministracion: formatearFecha(
                        recordatorio.fechaProgramada,
                      ),
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
