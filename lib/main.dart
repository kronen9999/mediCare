import 'package:flutter/material.dart';
import 'package:medicare/screens/familiar/familiarhome.dart';
import 'package:medicare/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? sesionIniciada;
  @override
  void initState() {
    super.initState();
    obtenerPreferencias();
  }

  List<Widget> pantallas = [const Homescreen(), const Familiarhome()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: sesionIniciada == null
            ? const Homescreen()
            : sesionIniciada == "Familiares"
            ? const Familiarhome()
            : const Homescreen(),
      ),
    );
  }

  Future<void> obtenerPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sesionIniciada = prefs.getString("TipoLogin");
    });
  }
}
