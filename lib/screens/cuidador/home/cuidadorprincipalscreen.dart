import 'package:flutter/material.dart';

class Cuidadorprincipalscreen extends StatefulWidget {
  const Cuidadorprincipalscreen({super.key});

  @override
  State<Cuidadorprincipalscreen> createState() =>
      _CuidadorprincipalscreenState();
}

class _CuidadorprincipalscreenState extends State<Cuidadorprincipalscreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [Text("Inicio cuidador")]),
    );
  }
}
