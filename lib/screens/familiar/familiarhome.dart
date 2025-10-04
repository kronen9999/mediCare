import 'package:flutter/material.dart';
import 'package:medicare/screens/familiar/familiar_cuidadores_screen.dart';
import 'package:medicare/screens/familiar/familiar_pacientes_screen.dart';
import 'package:medicare/screens/familiar/familiar_perfil_screen.dart';
import 'package:medicare/screens/familiar/familiar_principal_screen.dart';

class Familiarhome extends StatefulWidget {
  const Familiarhome({super.key});

  @override
  State<Familiarhome> createState() => _FamiliarhomeState();
}

class _FamiliarhomeState extends State<Familiarhome> {
  int _selectedIndex = 0;

  final List<Widget> _sections = [
    FamiliarPrincipalScreen(),
    FamiliarCuidadoresScreen(),
    FamiliarPacientesScreen(),
    FamiliarPerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sections[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.black, // Color para el ítem seleccionado
        unselectedItemColor:
            Colors.grey, // Color para los ítems no seleccionados
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ), // Opcional: estilo del texto seleccionado
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Cuidadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Pacientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
