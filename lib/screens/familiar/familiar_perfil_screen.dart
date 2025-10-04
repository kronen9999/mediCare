import 'package:flutter/material.dart';

class FamiliarPerfilScreen extends StatefulWidget {
  const FamiliarPerfilScreen({super.key});

  @override
  State<FamiliarPerfilScreen> createState() => _FamiliarPerfilScreenState();
}

class _FamiliarPerfilScreenState extends State<FamiliarPerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Text("Pantalla de perfil del familiar")]),
    );
  }
}
