import 'package:flutter/material.dart';
//import 'package:medicare/screens/familiar/Inicio/familiar_chat_ia_widget.dart';
import 'package:medicare/screens/familiar/Inicio/familiar_chat_iapersonalizada.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamiliarPrincipalScreen extends StatefulWidget {
  const FamiliarPrincipalScreen({super.key});

  @override
  State<FamiliarPrincipalScreen> createState() =>
      _FamiliarPrincipalScreenState();
}

class _FamiliarPrincipalScreenState extends State<FamiliarPrincipalScreen> {
  String? idFamiliar;
  String? tokenAcceso;
  String tipoScreen = "default";

  @override
  void initState() {
    super.initState();
    obtenerDatos();
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
              ? cuerpoPrincipal()
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

  Column cuerpoPrincipal() =>
      Column(children: [Text("Pantalla principal del familiar")]);
}
