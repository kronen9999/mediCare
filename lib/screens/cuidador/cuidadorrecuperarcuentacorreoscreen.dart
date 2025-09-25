import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/models/cuidadores/cuidadores_recupearcuentapcorreo.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidador/cuidadorverificarcodigoscreen.dart';

class Cuidadorrecuperarcuentacorreoscreen extends StatefulWidget {
  const Cuidadorrecuperarcuentacorreoscreen({super.key});

  @override
  State<Cuidadorrecuperarcuentacorreoscreen> createState() =>
      _CuidadorrecuperarcuentacorreoscreenState();
}

class _CuidadorrecuperarcuentacorreoscreenState
    extends State<Cuidadorrecuperarcuentacorreoscreen> {
  String? _correo;
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
                      Icons.mail_outline,
                      color: Color.fromARGB(255, 0, 166, 62),
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
                                _correo = value;
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
                              enviarCodigo(context);
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

  void enviarCodigo(context) async {
    if (_correo == null || _correo!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor ingrese un correo electronico"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    CuidadoresRepositoryGlobal repo = CuidadoresRepositoryGlobal();
    try {
      final result = await repo.enviarCodigoRecuperacion(
        CuidadoresRecupearcuentapcorreo(correoE: _correo ?? ''),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Cuidadorverificarcodigoscreen(correoE: _correo ?? ''),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }
}
