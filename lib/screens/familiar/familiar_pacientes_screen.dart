import 'package:flutter/material.dart';
import 'package:medicare/screens/familiar/pacientes/familiar_paciente_agregarpaciente_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamiliarPacientesScreen extends StatefulWidget {
  const FamiliarPacientesScreen({super.key});

  @override
  State<FamiliarPacientesScreen> createState() =>
      _FamiliarPacientesScreenState();
}

class _FamiliarPacientesScreenState extends State<FamiliarPacientesScreen> {
  String? idFamiliar;
  String? tokenAcceso;
  String seccion = "defecto";

  @override
  void initState() {
    super.initState();
    obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: seccion == "defecto"
            ? defecto()
            : seccion == "agregarPaciente"
            ? FamiliarPacienteAgregarpacienteScreen(
                idFamiliar: idFamiliar,
                tokenAcceso: tokenAcceso,
                onSelect: asignarSeccion,
              )
            : defecto(),
      ),
    );
  }

  SingleChildScrollView defecto() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(201, 85, 255, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.personal_injury_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Gestionar pacientes",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Administre sus pacientes",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
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
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  asignarSeccion("agregarPaciente");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    Text(
                      "Agregar nuevo paciente",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 5,
              bottom: 25,
            ),
            child: SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(109, 236, 230, 230),
                  hintText: "Buscar paciente",
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
                  prefixIcon: Icon(Icons.search, color: Colors.blue),
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
                      color:
                          Colors.blue, // Color del borde cuando está enfocado
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Lista de pacientes",
                style: TextStyle(
                  color: Color.fromRGBO(85, 150, 255, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void obtenerDatos() async {
    final pref = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    setState(() {
      idFamiliar = pref.getString("IdUsuario");
      tokenAcceso = pref.getString("TokenAcceso");
    });
  }

  asignarSeccion(String seccion) {
    setState(() {
      this.seccion = seccion;
    });
  }
}
