import 'package:flutter/material.dart';
import 'package:medicare/models/familiares/admcuidadores/familiares_cuidadores_cambiar_contrasena.dart';
import 'package:medicare/models/familiares/admcuidadores/familiares_cuidadores_editar_informacion_cuenta.dart';
import 'package:medicare/models/familiares/admcuidadores/familiares_cuidadores_editar_informacion_perfil.dart';
import 'package:medicare/models/familiares/admcuidadores/familiares_cuidadores_obtener_cuidador.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';

class FamiliarAdmcuidadoresEditarCuidadorWidget extends StatefulWidget {
  final String? idFamiliar;
  final String? tokenAcceso;
  final String? idCuidador;
  final void Function(String) onSelect;
  final void Function(String, String) onUpdate;
  const FamiliarAdmcuidadoresEditarCuidadorWidget({
    super.key,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idCuidador,
    required this.onSelect,
    required this.onUpdate,
  });

  @override
  State<FamiliarAdmcuidadoresEditarCuidadorWidget> createState() =>
      _FamiliarAdmcuidadoresEditarCuidadorWidgetState();
}

class _FamiliarAdmcuidadoresEditarCuidadorWidgetState
    extends State<FamiliarAdmcuidadoresEditarCuidadorWidget> {
  String? nombre = "Obteniendo datos...";
  String? apellidoP = "Obteniendo datos...";
  String? apellidoM = "Obteniendo datos...";
  String? direccion = "Obteniendo datos...";
  String? telefono1 = "Obteniendo datos...";
  String? telefono2 = "Obteniendo datos...";
  String? correoE = "Obteniendo datos...";
  String? usuario = "Obteniendo datos...";
  String? nuevaContrasena = "Obteniendo datos...";
  String? confirmarContrasena = "Obteniendo datos...";

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoPController = TextEditingController();
  TextEditingController apellidoMController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController telefono1Controller = TextEditingController();
  TextEditingController telefono2Controller = TextEditingController();
  TextEditingController correoEController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController nuevaContrasenaController = TextEditingController();
  TextEditingController confirmarContrasenaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = "Obteniendo datos...";
    apellidoPController.text = "Obteniendo datos...";
    apellidoMController.text = "Obteniendo datos...";
    direccionController.text = "Obteniendo datos...";
    telefono1Controller.text = "Obteniendo datos...";
    telefono2Controller.text = "Obteniendo datos...";
    correoEController.text = "Obteniendo datos...";
    usuarioController.text = "Obteniendo datos...";
    obtenerCuidador(
      widget.idFamiliar ?? "",
      widget.tokenAcceso ?? "",
      widget.idCuidador ?? "",
    );
  }

  @override
  void dispose() {
    nombreController.dispose();
    apellidoPController.dispose();
    apellidoMController.dispose();
    direccionController.dispose();
    telefono1Controller.dispose();
    telefono2Controller.dispose();
    correoEController.dispose();
    usuarioController.dispose();
    nuevaContrasenaController.dispose();
    confirmarContrasenaController.dispose();
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
                child: Icon(Icons.edit_outlined, color: Colors.white, size: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Editar un cuidador",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Edita la informacion personal y acceso del cuidador",
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
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Informacion personal",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, height: 30),
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
                          hintText: "Ingresa el nombre",
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
                            Icons.person_outline,
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
                          hintText: "Ingresa el apellido paterno",
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
                            Icons.person_4_outlined,
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
                        "Apellido Materno",
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
                          hintText: "Ingresa el apellido materno",
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
                            Icons.person_2_outlined,
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
                          hintText: "Ingresa la direccion del cuidador",
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
                            Icons.person_pin_circle_outlined,
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
                        "Telefono principal",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: telefono1Controller,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
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
                          hintText: "Ingresa el telefono principal",
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
                            Icons.phone_outlined,
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
                        "Telefono secundario",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        controller: telefono2Controller,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
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
                          hintText: "Ingresa el telefono secundario",
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
                            Icons.phone_outlined,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () {
                          actualizarInformacionPersonal(context);
                        },
                        child: Text(
                          "Guardar cambios",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
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
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Informacion de acceso",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Correo electronico (opcional)",
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
                          hintText: "Ingresa el correo electronico",
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
                            Icons.mail_outline_outlined,
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
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        controller: usuarioController,
                        maxLength: 20,
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
                          hintText: "Ingresa el usuario",
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
                            Icons.person_search_outlined,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () {
                          actualizarInformacionAcceso(context);
                        },
                        child: Text(
                          "Guardar cambios",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
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
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Cambiar contraseña",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Nueva contraseña",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: nuevaContrasenaController,
                        maxLength: 15,
                        onChanged: (value) {
                          setState(() {
                            nuevaContrasena = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Contraseña nueva",
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
                            Icons.lock_open_outlined,
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
                        "Repita la contraseña",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        controller: confirmarContrasenaController,
                        maxLength: 15,
                        onChanged: (value) {
                          setState(() {
                            confirmarContrasena = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Repita la contraseña",
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
                            Icons.lock_open_outlined,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () {
                          cambiarContrasena(
                            context,
                            nuevaContrasena ?? "",
                            confirmarContrasena ?? "",
                          );
                        },
                        child: Text(
                          "Cambiar contraseña",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
              bottom: 25,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: TextButton(
                onPressed: () {
                  widget.onSelect("default");
                },
                child: Text(
                  "Regresar",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void obtenerCuidador(
    String idFamiliar,
    String tokenAcceso,
    String idCuidador,
  ) async {
    final repo = FamiliaresReposotoryGlobal();
    final response = await repo.obtenerCuidador(
      FamiliaresCuidadoresObtenerCuidador(
        idFamiliar: idFamiliar,
        tokenAcceso: tokenAcceso,
        idCuidador: idCuidador,
      ),
    );
    if (!mounted) return;
    setState(() {
      nombre = response.nombre ?? "";
      apellidoP = response.apellidoP ?? "";
      apellidoM = response.apellidoM ?? "";
      correoE = response.correoE ?? "";
      usuario = response.usuario ?? "";
      direccion = response.direccion ?? "";
      telefono1 = response.telefono1 ?? "";
      telefono2 = response.telefono2 ?? "";

      nombreController.text = response.nombre ?? "";
      apellidoPController.text = response.apellidoP ?? "";
      apellidoMController.text = response.apellidoM ?? "";
      direccionController.text = response.direccion ?? "";
      telefono1Controller.text = response.telefono1 ?? "";
      telefono2Controller.text = response.telefono2 ?? "";
      correoEController.text = response.correoE ?? "";
      usuarioController.text = response.usuario ?? "";
    });
  }

  void actualizarInformacionPersonal(context) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      final result = await repo.cuidadoresEditarInformacionPersonal(
        FamiliaresCuidadoresEditarInformacionPerfil(
          idFamiliar: widget.idFamiliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idCuidador: widget.idCuidador ?? "",
          nombre: nombre ?? "",
          apellidoP: apellidoP ?? "",
          apellidoM: apellidoM ?? "",
          direccion: direccion ?? "",
          telefono1: telefono1 ?? "",
          telefono2: telefono2 ?? "",
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            result.message ?? "No se recibió respuesta del servidor",
          ),
        ),
      );
      widget.onUpdate(widget.idFamiliar ?? "", widget.tokenAcceso ?? "");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  void actualizarInformacionAcceso(context) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      final result = await repo.cuidadorActualizarInformacionCuenta(
        FamiliaresCuidadoresEditarInformacionCuentaAcceso(
          idFamiliar: widget.idFamiliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idCuidador: widget.idCuidador,
          correoE: correoE ?? "",
          usuario: usuario ?? "",
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            result.message ?? "No se recibió respuesta del servidor",
          ),
        ),
      );
      widget.onUpdate(widget.idFamiliar ?? "", widget.tokenAcceso ?? "");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  void cambiarContrasena(
    context,
    String nuevaContrasena,
    String confirmarContrasena,
  ) async {
    if (nuevaContrasena != confirmarContrasena) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Las contraseñas no coinciden"),
        ),
      );
      return;
    }
    final repo = FamiliaresReposotoryGlobal();
    try {
      final result = await repo.cuidadorCambiarContrasena(
        FamiliaresCuidadoresCambiarContrasena(
          idFamiliar: widget.idFamiliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idCuidador: widget.idCuidador ?? "",
          nuevaContrasena: nuevaContrasena,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            result.message ?? "No se recibió respuesta del servidor",
          ),
        ),
      );
      nuevaContrasenaController.text = "";
      confirmarContrasenaController.text = "";
      nuevaContrasena = "";
      confirmarContrasena = "";
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }
}
