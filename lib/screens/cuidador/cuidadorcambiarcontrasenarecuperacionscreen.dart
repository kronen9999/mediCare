import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/models/cuidadores/cuidadores_restablecercontrasena.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidadorloginscreen.dart';

class Cuidadorcambiarcontrasenarecuperacionscreen extends StatefulWidget {
  final String correoE;
  final String codigoVerificacion;
  const Cuidadorcambiarcontrasenarecuperacionscreen({
    super.key,
    required this.correoE,
    required this.codigoVerificacion,
  });

  @override
  State<Cuidadorcambiarcontrasenarecuperacionscreen> createState() =>
      _CuidadorcambiarcontrasenarecuperacionscreenState();
}

class _CuidadorcambiarcontrasenarecuperacionscreenState
    extends State<Cuidadorcambiarcontrasenarecuperacionscreen> {
  String? campoNuevaContrasena1;
  String? campoNuevaContrasena2;
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
                      Icons.lock_person_outlined,
                      color: Color.fromARGB(255, 0, 166, 62),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Nueva contraseña",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Crea una nueva contraseña segura para tu cuenta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .5),
                  ),
                  margin: EdgeInsets.only(top: 50),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Nueva contraseña",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  campoNuevaContrasena1 = value;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                hintText: "Ingresa tu nueva contraseña",
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
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Confirmar contraseña",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  campoNuevaContrasena2 = value;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                hintText: "Confirma tu nueva contraseña",
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
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.black,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              cambioContrasena(context);
                            },
                            child: Text("Restablecer contraseña"),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "La contraseña debe tener al menos 8 caracteres",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cambioContrasena(context) async {
    if (campoNuevaContrasena1 == null ||
        campoNuevaContrasena2 == null ||
        campoNuevaContrasena1!.isEmpty ||
        campoNuevaContrasena2!.isEmpty) {
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
      final result = await repo.restablerContrasena(
        CuidadoresRestablecercontrasena(
          correoE: widget.correoE,
          codigoVerificacion: widget.codigoVerificacion,
          nuevaContrasena: campoNuevaContrasena1 ?? '',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message), backgroundColor: Colors.green),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cuidadorloginscreen()),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
