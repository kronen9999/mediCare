import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/models/familiares/familiares_restablecercontrasena.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/screens/familiarloginscreen.dart';

class Familiarcambiarcontrasenarecuperacionscreen extends StatefulWidget {
  final String? correoE;
  final String? codigoVerificacion;
  const Familiarcambiarcontrasenarecuperacionscreen({
    super.key,
    required this.correoE,
    required this.codigoVerificacion,
  });

  @override
  State<Familiarcambiarcontrasenarecuperacionscreen> createState() =>
      _FamiliarcambiarcontrasenarecuperacionscreenState();
}

class _FamiliarcambiarcontrasenarecuperacionscreenState
    extends State<Familiarcambiarcontrasenarecuperacionscreen> {
  String? nuevaContrasena;
  String? campoContrasena1;
  String? campoContrasena2;
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
                    color: Color.fromARGB(31, 21, 93, 252),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      Icons.lock_person_outlined,
                      color: Color.fromARGB(255, 21, 93, 252),
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
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  campoContrasena1 = value;
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
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  campoContrasena2 = value;
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
                              if (campoContrasena1 == null ||
                                  campoContrasena2 == null ||
                                  campoContrasena1!.isEmpty ||
                                  campoContrasena2!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "No puede dejar campos vacios",
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (campoContrasena1 != campoContrasena2) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Los campos no coinciden"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                nuevaContrasena = campoContrasena1;
                                cambiarContrasena(context);
                              }
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

  void cambiarContrasena(context) async {
    FamiliaresReposotoryGlobal repo = FamiliaresReposotoryGlobal();
    try {
      final result = await repo.restablecerContrasena(
        FamiliaresRestablecercontrasena(
          correoE: widget.correoE ?? '',
          codigoVerificacion: widget.codigoVerificacion ?? '',
          nuevaContrasena: campoContrasena1 ?? '',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.message.toString()),
          backgroundColor: Colors.green,
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Familiarloginscreen()),
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
