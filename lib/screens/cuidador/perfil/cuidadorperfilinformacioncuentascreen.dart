import 'package:flutter/material.dart';
import 'package:medicare/models/cuidadores/perfil/cuidadores_perfil_actualizarinformacioncuenta.dart';
import 'package:medicare/models/cuidadores/perfil/cuidadores_perfil_obtenerperfilbasico.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';

class Cuidadorperfilinformacioncuentascreen extends StatefulWidget {
  final String? idCuidador;
  final String? tokenAcceso;
  final void Function(String) onSelection;
  final void Function(String?, String?) onUpdate;
  const Cuidadorperfilinformacioncuentascreen({
    super.key,
    required this.idCuidador,
    required this.tokenAcceso,
    required this.onSelection,
    required this.onUpdate,
  });

  @override
  State<Cuidadorperfilinformacioncuentascreen> createState() =>
      _CuidadorperfilinformacioncuentascreenState();
}

class _CuidadorperfilinformacioncuentascreenState
    extends State<Cuidadorperfilinformacioncuentascreen> {
  String? correoE = "Obteniendo datos...";
  String? usuario = "Obteniendo datos...";

  TextEditingController correoEController = TextEditingController();
  TextEditingController usuarioEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    correoEController.text = correoE ?? "";
    usuarioEController.text = usuario ?? "";
    obtenerDatos(widget.idCuidador!, widget.tokenAcceso!);
  }

  @override
  void dispose() {
    correoEController.dispose();
    usuarioEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.mail_outline_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Editar informacion de la cuenta",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Actualiza tu correo electrónico y usuario",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(221, 214, 212, 212),
                    spreadRadius: .5,
                    blurRadius: 8,
                    offset: Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(79, 172, 196, 1),
                  width: .5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Correo Electrónico",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        controller: correoEController,
                        onChanged: (value) {
                          setState(() {
                            correoE = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu correo electrónico",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(79, 172, 196, 1),
                              width: .5,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors
                                  .green, // Color del borde cuando está habilitado
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors
                                  .green, // Color del borde cuando está enfocado
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Usuario",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: TextField(
                        controller: usuarioEController,
                        onChanged: (value) {
                          setState(() {
                            usuario = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa un nombre de usuario",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(79, 172, 196, 1),
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors
                                  .green, // Color del borde cuando está habilitado
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors
                                  .green, // Color del borde cuando está enfocado
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 145,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              actualizarDatos(usuario, correoE, context);
                            },
                            child: Text(
                              "Guardar cambios",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 145,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              widget.onSelection("default");
                            },
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      ],
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

  void obtenerDatos(String? idCuidador, String? tokenAcceso) async {
    final repo = CuidadoresRepositoryGlobal();
    final result = await repo.obtenerPerfilBasico(
      CuidadoresPerfilObtenerperfilbasico(
        idCuidador: idCuidador ?? "",
        tokenAcceso: tokenAcceso ?? "",
      ),
    );
    if (!mounted) {
      return;
    }
    setState(() {
      correoE = result.correoE ?? "";
      usuario = result.usuario ?? "";
      correoEController.text = result.correoE ?? "";
      usuarioEController.text = result.usuario ?? "";
    });
  }

  void actualizarDatos(String? usuario, String? correo, context) async {
    final repo = CuidadoresRepositoryGlobal();
    try {
      showDialog(
        context: context,
        builder: (_) =>
            Center(child: CircularProgressIndicator(color: Colors.green)),
        barrierDismissible: false,
      );
      final result = await repo.actualizarInformacionCuenta(
        CuidadoresPerfilActualizarinformacioncuenta(
          idCuidador: widget.idCuidador ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          usuario: usuario ?? "",
          correoE: correoE ?? "",
        ),
      );
      Navigator.of(context).pop();
      if (!mounted) {
        return;
      }
      widget.onUpdate(widget.idCuidador, widget.tokenAcceso);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      widget.onSelection("default");
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }
}
