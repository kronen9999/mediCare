import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/models/cuidadores/cuidadores_login.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidador/cuidadorhomescreen.dart';
import 'package:medicare/screens/cuidador/cuidadorseleccionrecuperacionscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cuidadorloginscreen extends StatefulWidget {
  const Cuidadorloginscreen({super.key});

  @override
  State<Cuidadorloginscreen> createState() => _CuidadorloginscreenState();
}

class _CuidadorloginscreenState extends State<Cuidadorloginscreen> {
  String? _credencial;
  String? _contrasena;
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
                    color: Color.fromARGB(100, 219, 252, 231),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      Icons.people_outline,
                      color: Color.fromARGB(255, 0, 166, 62),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Ingresar como cuidador",
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
                              onChanged: (value) {
                                setState(() {
                                  _credencial = value;
                                });
                              },
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
                              onChanged: (value) {
                                setState(() {
                                  _contrasena = value;
                                });
                              },
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
                              onPressed: () {
                                loginCuidador(context);
                              },
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
                        Text("Nota:Se requiere cuenta creada por el familiar"),
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
                      builder: (context) =>
                          Cuidadorseleccionrecuperacionscreen(),
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

  void loginCuidador(context) async {
    if (_credencial == null ||
        _contrasena == null ||
        _credencial!.isEmpty ||
        _contrasena!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, completa todos los campos"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    CuidadoresRepositoryGlobal repo = CuidadoresRepositoryGlobal();

    try {
      showDialog(
        context: context,
        builder: (_) =>
            Center(child: CircularProgressIndicator(color: Colors.green)),
        barrierDismissible: false,
      );
      final result = await repo.loginCuidador(
        CuidadoresLogin(
          contrasena: _contrasena ?? '',
          credencial: _credencial ?? '',
        ),
      );
      guardarDatos(
        result.usuario?.idUsuario.toString(),
        result.usuario?.tokenAcceso,
      );
      Navigator.of(context).pop();
      Future.delayed(Duration(seconds: 1));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cuidadorhomescreen()),
      );
    } catch (e) {
      Navigator.of(context).pop();
      String message = e.toString();
      if (message.startsWith("ClientException")) {
        message =
            "Error de conexión. Por favor, verifica tu conexión a internet e intentalo de nuevo.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.replaceAll('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void guardarDatos(String? idCuidador, String? tokenAcceso) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("IdCuidador", idCuidador ?? "");
    prefs.setString("TokenAcceso", tokenAcceso ?? "");
    prefs.setString("TipoLogin", "Cuidadores");
  }
}
