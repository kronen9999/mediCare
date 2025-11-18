import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/models/cuidadores/cuidadores_recupearcuentapcorreo.dart';
import 'package:medicare/models/cuidadores/cuidadores_verificarcodigorecuperacion.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidador/cuidadorcambiarcontrasenarecuperacionscreen.dart';

class Cuidadorverificarcodigoscreen extends StatefulWidget {
  final String? correoE;
  const Cuidadorverificarcodigoscreen({super.key, required this.correoE});

  @override
  State<Cuidadorverificarcodigoscreen> createState() =>
      _CuidadorverificarcodigoscreenState();
}

class _CuidadorverificarcodigoscreenState
    extends State<Cuidadorverificarcodigoscreen> {
  String? _codigoVerificacion;
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
                      Icons.shield_outlined,
                      color: Color.fromARGB(255, 0, 166, 62),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Verificar codigo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Ingresa el codigo de verificacion que te enviamos a tu correo",
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
                              "Codigo de verificación",
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
                            width: 150,
                            child: TextField(
                              maxLength: 10,
                              onChanged: (value) {
                                setState(() {
                                  _codigoVerificacion = value;
                                });
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "0000000000",
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
                              verificarCodigo(context);
                            },
                            child: Text("Verificar codigo"),
                          ),
                        ),
                        Divider(height: 80, color: Colors.grey),
                        Text(
                          "¿No recibiste el codigo?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              enviarCodigo(context);
                            },
                            child: Text(
                              "Reenviar codigo",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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

  void verificarCodigo(context) async {
    if (_codigoVerificacion == null || _codigoVerificacion!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor ingresa el codigo de verificación"),
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
      final response = await repo.verificarCodigo(
        CuidadoresVerificarcodigorecuperacion(
          correoE: widget.correoE ?? '',
          codigoVerificacion: _codigoVerificacion ?? '',
        ),
      );
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Cuidadorcambiarcontrasenarecuperacionscreen(
            correoE: widget.correoE ?? '',
            codigoVerificacion: _codigoVerificacion ?? '',
          ),
        ),
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

  void enviarCodigo(context) async {
    if (widget.correoE == null || widget.correoE!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No hay un correo electrónico proporcionado"),
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
      final result = await repo.enviarCodigoRecuperacion(
        CuidadoresRecupearcuentapcorreo(correoE: widget.correoE ?? ''),
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message), backgroundColor: Colors.green),
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
      return;
    }
  }
}
