import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        padding: const EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
          bottom: 15,
        ),
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
            border: Border.all(
              color: Color.fromRGBO(79, 172, 196, 1),
              width: .5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.timer_outlined, color: Colors.blue, size: 22),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "20 de octubre 08:00am",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Paciente: Alejandro",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Cuidador asignado: Pablo",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.medical_information_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PARACETAMOL",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 16, 71, 116),
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child: Text(
                                  "Dosis: 1 Tableta",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              Text(
                                "💡 Tomar con agua",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.done, color: Colors.white),
                            ),
                            Text(
                              "Registrar administracion",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Cancelar administracion",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
