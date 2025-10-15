import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cuidadorhomescreen extends StatefulWidget {
  const Cuidadorhomescreen({super.key});

  @override
  State<Cuidadorhomescreen> createState() => _CuidadorhomescreenState();
}

class _CuidadorhomescreenState extends State<Cuidadorhomescreen> {
  int _selectedIndex = 0;
  final List<Widget> _sections = [
    Center(child: Text('Inicio')),
    Center(child: Text('Perfil')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(85, 150, 255, 1),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(138, 183, 255, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    "assets/images/heart.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "MediCare",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 150),
            ],
          ),
        ],
      ),
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
