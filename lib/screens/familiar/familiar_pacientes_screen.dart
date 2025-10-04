import 'package:flutter/material.dart';

class FamiliarPacientesScreen extends StatefulWidget {
  const FamiliarPacientesScreen({super.key});

  @override
  State<FamiliarPacientesScreen> createState() =>
      _FamiliarPacientesScreenState();
}

class _FamiliarPacientesScreenState extends State<FamiliarPacientesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text("Pantalla de pacientes del familiar")]),
    );
  }
}
