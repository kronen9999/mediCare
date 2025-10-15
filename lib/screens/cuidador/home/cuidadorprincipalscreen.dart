import 'package:flutter/material.dart';
import 'package:medicare/screens/cuidador/home/cuidador_chat_ia_widget.dart';

class Cuidadorprincipalscreen extends StatefulWidget {
  const Cuidadorprincipalscreen({super.key});

  @override
  State<Cuidadorprincipalscreen> createState() =>
      _CuidadorprincipalscreenState();
}

class _CuidadorprincipalscreenState extends State<Cuidadorprincipalscreen> {
  String seccion = "default";
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

  SizedBox principal() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [Text("Inicio cuidador")]),
    );
  }

  void asignarSeccion(String nuevaSeccion) {
    setState(() {
      seccion = nuevaSeccion;
    });
  }
}
