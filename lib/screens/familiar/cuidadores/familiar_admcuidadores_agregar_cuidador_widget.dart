import 'package:flutter/material.dart';

class FamiliarAdmcuidadoresAgregarCuidadorWidget extends StatefulWidget {
  const FamiliarAdmcuidadoresAgregarCuidadorWidget({super.key});

  @override
  State<FamiliarAdmcuidadoresAgregarCuidadorWidget> createState() =>
      _FamiliarAdmcuidadoresAgregarCuidadorWidgetState();
}

class _FamiliarAdmcuidadoresAgregarCuidadorWidgetState
    extends State<FamiliarAdmcuidadoresAgregarCuidadorWidget> {
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
              "Agregar un nuevo cuidador",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Agrega un cuidador a tu lista de cuidadores",
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
                        onChanged: (value) {
                          setState(() {});
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
                        onChanged: (value) {
                          setState(() {});
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
                        onChanged: (value) {
                          setState(() {});
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
                        onChanged: (value) {
                          setState(() {});
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
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          setState(() {});
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
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          setState(() {});
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
                        "Informacion de la cuenta",
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
                        onChanged: (value) {
                          setState(() {});
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
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        maxLength: 20,
                        onChanged: (value) {
                          setState(() {});
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
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Contraseña",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        maxLength: 15,
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Contraseña para el cuidador",
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
              bottom: 10,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Guardar cuidador",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Cancelar",
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
}
