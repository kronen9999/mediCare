import 'package:flutter/material.dart';

class FamiliarPrincipalScreen extends StatefulWidget {
  const FamiliarPrincipalScreen({super.key});

  @override
  State<FamiliarPrincipalScreen> createState() =>
      _FamiliarPrincipalScreenState();
}

class _FamiliarPrincipalScreenState extends State<FamiliarPrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [Text("Pantalla principal del familiar")]),
        ),
      ),
    );
  }
}
