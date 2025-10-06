import 'package:flutter/material.dart';
import 'package:medicare/components/familiares/familiar_perfil_screen/apartado_estadisticas.dart';
import 'package:medicare/components/familiares/familiar_perfil_screen/apartado_opciones.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/repositories/familiares/perfil/familiares_obtener_perfil.dart';
import 'package:medicare/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamiliarPerfilScreen extends StatefulWidget {
  const FamiliarPerfilScreen({super.key});

  @override
  State<FamiliarPerfilScreen> createState() => _FamiliarPerfilScreenState();
}

class _FamiliarPerfilScreenState extends State<FamiliarPerfilScreen> {
  String? numCuidadores = "4";
  String? numPacientes = "3";
  String? idUsuario;
  String? tokenAcceso;
  String? correo = "obteniendoDatos...";
  String? usuario = "obteniendoDatos...";
  @override
  void initState() {
    super.initState();
    obtenerPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
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
                "Mi Perfil",
                style: TextStyle(
                  color: Color.fromRGBO(85, 150, 255, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "Gestiona tu informacion personal",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            ApartadoOpciones(
              correo: correo ?? "No hay datos",
              usuario: usuario ?? "Sin nombre de usuario",
            ),
            ApartadoEstadisticas(
              cuidadores: numCuidadores,
              pacientes: numPacientes,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 185, 33, 59),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    cerrarSesion();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homescreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Text(
                        "Cerrar Sesion",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
    );
  }

  void obtenerPerfil() async {
    final prefs = await SharedPreferences.getInstance();
    idUsuario = prefs.getString('IdUsuario') ?? '';
    tokenAcceso = prefs.getString('TokenAcceso') ?? '';
    final repo = FamiliaresReposotoryGlobal();
    final perfil = await repo.obtenerPerfil(
      FamiliaresObtenerPerfil(idFamiliar: idUsuario, tokenAcceso: tokenAcceso),
    );
    setState(() {
      usuario = perfil.informacionCuenta?.usuario ?? 'No disponible';
      correo = perfil.informacionCuenta?.correoE ?? 'No disponible';
    });
  }

  void cerrarSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
