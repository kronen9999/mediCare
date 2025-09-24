import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/models/familiares/familiares_recuperarcuentapcorreo.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/screens/familiar/familiarverificarcodigoscreen.dart';

class Familiarrecuperarcuenta extends StatefulWidget {
  const Familiarrecuperarcuenta({super.key});

  @override
  State<Familiarrecuperarcuenta> createState() =>
      _FamiliarrecuperarcuentaState();
}

class _FamiliarrecuperarcuentaState extends State<Familiarrecuperarcuenta> {
  String? correoE;
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
                      Icons.mail_outline,
                      color: Color.fromARGB(255, 21, 93, 252),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Recuperar contraseña",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Te enviaremos un código de verificación a tu correo electrónico",
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
                              "Correo electronico",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                correoE = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Ingresa tu correo electronico",
                              prefixIcon: Icon(Icons.mail_outline),
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
                              recuperarCuenta(context);
                            },
                            child: Text("Enviar codigo"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "¿Recordaste tu constraseña?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
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

  void recuperarCuenta(context) async {
    FamiliaresReposotoryGlobal repo = FamiliaresReposotoryGlobal();
    try {
      final response = await repo.recuperarCuentaPCorreo(
        FamiliaresRecuperarcuentapcorreo(correoE: correoE ?? ''),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Familiarverificarcodigoscreen(correoE: correoE),
        ),
      );
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
