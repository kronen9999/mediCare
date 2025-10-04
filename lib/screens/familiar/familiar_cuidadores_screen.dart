import 'package:flutter/material.dart';

class FamiliarCuidadoresScreen extends StatefulWidget {
  const FamiliarCuidadoresScreen({super.key});

  @override
  State<FamiliarCuidadoresScreen> createState() =>
      _FamiliarCuidadoresScreenState();
}

class _FamiliarCuidadoresScreenState extends State<FamiliarCuidadoresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text("Pantalla de cuidadores del familiar")]),
    );
  }
}
