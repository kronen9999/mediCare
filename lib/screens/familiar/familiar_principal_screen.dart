import 'package:flutter/material.dart';
import 'package:medicare/screens/familiar/Inicio/familiar_chat_ia_widget.dart';
import 'package:medicare/screens/familiar/Inicio/familiar_chat_iapersonalizada.dart';

class FamiliarPrincipalScreen extends StatefulWidget {
  const FamiliarPrincipalScreen({super.key});

  @override
  State<FamiliarPrincipalScreen> createState() =>
      _FamiliarPrincipalScreenState();
}

class _FamiliarPrincipalScreenState extends State<FamiliarPrincipalScreen> {
  String tipoScreen = "default";
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
              ? FamiliarChatIapersonalizada() //FamiliarChatIaWidget()
              : Text("Otra pantalla"),
        ),
      ),
    );
  }

  Column cuerpoPrincipal() =>
      Column(children: [Text("Pantalla principal del familiar")]);
}
