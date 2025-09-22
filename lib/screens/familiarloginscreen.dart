import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/screens/familiar/familiarrecuperarcuenta.dart';
import 'package:medicare/screens/familiar/familiarregistroscreen.dart';

class Familiarloginscreen extends StatefulWidget {
  const Familiarloginscreen({super.key});

  @override
  State<Familiarloginscreen> createState() => _FamiliarloginscreenState();
}

class _FamiliarloginscreenState extends State<Familiarloginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 150),
            ],
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(31, 21, 93, 252),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      Icons.people_outline,
                      color: Color.fromARGB(255, 21, 93, 252),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Ingresar como familiar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Ingresa tus credenciales para acceder",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: .5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Usuario o Correo Electrónico",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Ingresa tu usuario o correo",
                                prefixIcon: Icon(Icons.person_outline),
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  59,
                                  180,
                                  180,
                                  182,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Contraseña",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55,

                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Ingresa tu contraseña",
                                prefixIcon: Icon(Icons.lock_person_outlined),
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  59,
                                  180,
                                  180,
                                  182,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text(
                                "Iniciar sesion",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey, height: 80),
                        Text("¿No tienes una cuenta?"),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Familiarregistroscreen(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Regístrate aquí",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Familiarrecuperarcuenta();
                      },
                    ),
                  );
                },
                child: Text(
                  "¿Olvidaste tu contraseña? Recupérala aquí",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
