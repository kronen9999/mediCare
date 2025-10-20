import 'package:flutter/material.dart';

class Cuidadorperfilactualizarcontrasenascreen extends StatefulWidget {
  final String? idFamiliar;
  final String? tokenAcceso;
  final void Function(String) onSelection;
  const Cuidadorperfilactualizarcontrasenascreen({
    super.key,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.onSelection,
  });

  @override
  State<Cuidadorperfilactualizarcontrasenascreen> createState() =>
      _CuidadorperfilactualizarcontrasenascreenState();
}

class _CuidadorperfilactualizarcontrasenascreenState
    extends State<Cuidadorperfilactualizarcontrasenascreen> {
  TextEditingController contrasenaActualController = TextEditingController();
  TextEditingController nuevaContrasenaController = TextEditingController();
  String? contrasenaA;
  String? contrasenaN;
  @override
  void dispose() {
    contrasenaActualController.dispose();
    nuevaContrasenaController.dispose();
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
                  Icons.lock_person_outlined,
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
                        "Contraseña Actual",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        obscureText: true,
                        controller: contrasenaActualController,
                        onChanged: (value) {
                          setState(() {
                            contrasenaA = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu contraseña actual",
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
                            Icons.lock_outline_rounded,
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
                        "Nueva Contraseña",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: TextField(
                        obscureText: true,
                        controller: nuevaContrasenaController,
                        onChanged: (value) {
                          setState(() {
                            contrasenaN = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa tu nueva contraseña",
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
                            Icons.lock_outline_rounded,
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
                              /*  actualizarContrasena(
                                widget.idFamiliar,
                                widget.tokenAcceso,
                                contrasenaA,
                                contrasenaN,
                                context,
                              );*/
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Divider(color: Colors.grey),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 253, 232, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: .5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Consejos de seguridad:",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "*Usa al menos 8 caracteres",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "* Incluye mayúsculas, minúsculas y números",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "* No reutilices contraseñas de otras cuentas",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "* Evita usar información personal",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
