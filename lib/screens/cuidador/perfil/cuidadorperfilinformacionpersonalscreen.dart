import 'package:flutter/material.dart';
import 'package:medicare/models/cuidadores/perfil/cuidadores_perfil_actualizarinformacionpersonal.dart';
import 'package:medicare/models/cuidadores/perfil/cuidadores_perfil_obtenerperfilbasico.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';

class Cuidadorperfilinformacionpersonalscreen extends StatefulWidget {
  final String? idCuidador;
  final String? tokenAcceso;
  final void Function(String) onSelection;
  const Cuidadorperfilinformacionpersonalscreen({
    super.key,
    required this.idCuidador,
    required this.tokenAcceso,
    required this.onSelection,
  });

  @override
  State<Cuidadorperfilinformacionpersonalscreen> createState() =>
      _CuidadorperfilinformacionpersonalscreenState();
}

class _CuidadorperfilinformacionpersonalscreenState
    extends State<Cuidadorperfilinformacionpersonalscreen> {
  String? nombre = "Obteniendo datos...";
  String? apellidoP = "Obteniendo datos...";
  String? apellidoM = "Obteniendo datos...";
  String? direccion = "Obteniendo datos...";
  String? telefono1 = "Obteniendo datos...";
  String? telefono2 = "Obteniendo datos...";
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoPController = TextEditingController();
  final TextEditingController apellidoMController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telefono1Controller = TextEditingController();
  final TextEditingController telefono2Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    nombreController.text = nombre ?? "";
    apellidoPController.text = apellidoP ?? "";
    apellidoMController.text = apellidoM ?? "";
    direccionController.text = direccion ?? "";
    telefono1Controller.text = telefono1 ?? "";
    telefono2Controller.text = telefono2 ?? "";
    obtenerDatos();
  }

  @override
  void dispose() {
    nombreController.dispose();
    apellidoPController.dispose();
    apellidoMController.dispose();
    direccionController.dispose();
    telefono1Controller.dispose();
    telefono2Controller.dispose();
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
              "Editar informacion de perfil",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Actualiza tu informacion personal",
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
                border: Border.all(color: Colors.green, width: .5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Nombre",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        controller: nombreController,
                        onChanged: (value) {
                          setState(() {
                            nombre = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu nombre",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: .5,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
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
                        "Apellido Paterno",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        controller: apellidoPController,
                        onChanged: (value) {
                          setState(() {
                            apellidoP = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu apellido paterno",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_4_outlined,
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
                        "Apellido Materno (Opcional)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        controller: apellidoMController,
                        onChanged: (value) {
                          setState(() {
                            apellidoM = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu apellido materno",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_3_outlined,
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
                        "Direccion",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        controller: direccionController,
                        onChanged: (value) {
                          setState(() {
                            direccion = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu direccion",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_pin_circle_outlined,
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
                        "Telefono principal",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: telefono1Controller,
                        onChanged: (value) {
                          setState(() {
                            telefono1 = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu telefono principal",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_outlined,
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
                        "Telefono secundario",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: telefono2Controller,
                        onChanged: (value) {
                          setState(() {
                            telefono2 = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu telefono secundario",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_outlined,
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
                              actualizarDatos(
                                nombre,
                                apellidoP,
                                apellidoM,
                                direccion,
                                telefono1,
                                telefono2,
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

  void obtenerDatos() async {
    final repo = CuidadoresRepositoryGlobal();
    final result = await repo.obtenerPerfilBasico(
      CuidadoresPerfilObtenerperfilbasico(
        idCuidador: widget.idCuidador ?? "",
        tokenAcceso: widget.tokenAcceso ?? "",
      ),
    );
    if (!mounted) {
      return;
    }
    setState(() {
      nombre = result.nombre ?? "";
      apellidoP = result.apellidoPaterno ?? "";
      apellidoM = result.apellidoMaterno ?? "";
      direccion = result.direccion ?? "";
      telefono1 = result.telefono1 ?? "";
      telefono2 = result.telefono2 ?? "";
      nombreController.text = nombre ?? "";
      apellidoPController.text = apellidoP ?? "";
      apellidoMController.text = apellidoM ?? "";
      direccionController.text = direccion ?? "";
      telefono1Controller.text = telefono1 ?? "";
      telefono2Controller.text = telefono2 ?? "";
    });
  }

  void actualizarDatos(
    String? nombre,
    String? apellidoP,
    String? apellidoM,
    String? direccion,
    String? telefono1,
    String? telefono2,
    context,
  ) async {
    final repo = CuidadoresRepositoryGlobal();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          const Center(child: CircularProgressIndicator(color: Colors.green)),
    );
    try {
      final result = await repo.actualizarInformacionPersonal(
        CuidadoresPerfilActualizarinformacionpersonal(
          idCuidador: widget.idCuidador ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          nombre: nombre ?? "",
          apellidoP: apellidoP ?? "",
          apellidoM: apellidoM ?? "",
          direccion: direccion ?? "",
          telefono1: telefono1 ?? "",
          telefono2: telefono2 ?? "",
        ),
      );
      if (mounted) {
        Navigator.of(context).pop();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      widget.onSelection("default");
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }
}
