import 'package:flutter/material.dart';
import 'package:medicare/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cuidadorperfilscreen extends StatefulWidget {
  const Cuidadorperfilscreen({super.key});

  @override
  State<Cuidadorperfilscreen> createState() => _CuidadorperfilscreenState();
}

class _CuidadorperfilscreenState extends State<Cuidadorperfilscreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: perfilPrincipal(),
    );
  }

  SingleChildScrollView perfilPrincipal() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 177, 22),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.person_outline_sharp,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Mi Perfil",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Gestiona tu informacion personal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 185, 33, 59),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  cerrarSesion(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      "Cerrar Sesion",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void cerrarSesion(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homescreen()),
    );
  }
}
