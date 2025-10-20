import 'package:flutter/material.dart';
import 'package:medicare/models/familiares/perfil/familiares_actualizar_informacion_cuenta.dart';
import 'package:medicare/models/familiares/perfil/familiares_obtener_perfil.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';

class FamiliarPerfilCambiarcontrasenaWidget extends StatefulWidget {
  final String? idFamiliar;
  final String? tokenAcceso;
  final void Function(String?) onSelection;
  final void Function(String?, String?) onUpdate;
  const FamiliarPerfilCambiarcontrasenaWidget({
    super.key,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.onSelection,
    required this.onUpdate,
  });

  @override
  State<FamiliarPerfilCambiarcontrasenaWidget> createState() =>
      _FamiliarPerfilCambiarcontrasenaWidgetState();
}

class _FamiliarPerfilCambiarcontrasenaWidgetState
    extends State<FamiliarPerfilCambiarcontrasenaWidget> {
  String? correoE = "Obteniendo datos...";
  String? usuario = "Obteniendo datos...";

  TextEditingController correoEController = TextEditingController();
  TextEditingController usuarioEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    correoEController.text = correoE ?? "";
    usuarioEController.text = usuario ?? "";
    obtenerDatos(widget.idFamiliar!, widget.tokenAcceso!);
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
                color: Color.fromRGBO(85, 150, 255, 1),
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
                color: Color.fromRGBO(85, 150, 255, 1),
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
                            color: Colors.blue,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(
                                79,
                                172,
                                196,
                                1,
                              ), // Color del borde cuando está habilitado
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors
                                  .blue, // Color del borde cuando está enfocado
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
                            color: Colors.blue,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(
                                79,
                                172,
                                196,
                                1,
                              ), // Color del borde cuando está habilitado
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors
                                  .blue, // Color del borde cuando está enfocado
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
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              actualizarDatos(
                                widget.idFamiliar,
                                widget.tokenAcceso,
                                correoE,
                                usuario,
                                context,
                              );
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
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              widget.onSelection("default");
                            },
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.blue),
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

  void obtenerDatos(String idFamiliar, String tokenAcceso) async {
    final repo = FamiliaresReposotoryGlobal();
    final result = await repo.obtenerPerfil(
      FamiliaresObtenerPerfil(idFamiliar: idFamiliar, tokenAcceso: tokenAcceso),
    );
    if (!mounted) return;
    setState(() {
      correoE = result.informacionCuenta?.correoE;
      usuario = result.informacionCuenta?.usuario;
      correoEController.text = correoE ?? "";
      usuarioEController.text = usuario ?? "";
    });
  }

  void actualizarDatos(
    String? idFamiliar,
    String? tokenAcceso,
    String? correoE,
    String? usuario,
    context,
  ) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      showDialog(
        context: context,
        builder: (_) =>
            Center(child: CircularProgressIndicator(color: Colors.blue)),
        barrierDismissible: false,
      );
      final result = await repo.actualizarDatosCuenta(
        FamiliaresActualizarInformacionCuenta(
          idFamiliar: widget.idFamiliar!,
          tokenAcceso: widget.tokenAcceso!,
          correoE: correoE ?? "",
          usuario: usuario ?? "",
        ),
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message), backgroundColor: Colors.green),
      );
      widget.onSelection("default");
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll("Excepction: ", "")),
          backgroundColor: Colors.red,
        ),
      );
    }
    widget.onUpdate(idFamiliar, tokenAcceso);
  }
}
