import 'package:flutter/material.dart';
import 'package:medicare/components/cuidadores/perfil/perfilinformacionadmwidget.dart';
import 'package:medicare/components/cuidadores/perfil/perfilopcioneswidget.dart';
import 'package:medicare/models/cuidadores/perfil/cuidadores_perfil_obtenerperfil.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/screens/cuidador/perfil/cuidadorperfilactualizarcontrasenascreen.dart';
import 'package:medicare/screens/cuidador/perfil/cuidadorperfilinformacioncuentascreen.dart';
import 'package:medicare/screens/cuidador/perfil/cuidadorperfilinformacionpersonalscreen.dart';
import 'package:medicare/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cuidadorperfilscreen extends StatefulWidget {
  const Cuidadorperfilscreen({super.key});

  @override
  State<Cuidadorperfilscreen> createState() => _CuidadorperfilscreenState();
}

class _CuidadorperfilscreenState extends State<Cuidadorperfilscreen> {
  String apartado = "default";
  String? idCuidador;
  String? tokenAcceso;
  String? usuarioCuidador = "Obteniendo datos...";
  String? correoCuidador = "Obteniendo datos...";
  String? nombreCFamiliar = "Obteniendo datos...";
  String? correoFamiliar = "Obteniendo datos...";
  String? direccionFamiliar = "Obteniendo datos...";
  String? telefono1Familiar = "Obteniendo datos...";
  String? telefono2Familiar = "Obteniendo datos...";

  @override
  void initState() {
    super.initState();
    obtenerDatos();
    obtenerDatosSesion();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: apartado == "default"
          ? perfilPrincipal()
          : apartado == "editarPerfil"
          ? Cuidadorperfilinformacionpersonalscreen(
              idCuidador: idCuidador,
              tokenAcceso: tokenAcceso,
              onSelection: cambiarApartado,
            )
          : apartado == "editarCuenta"
          ? Cuidadorperfilinformacioncuentascreen(
              idCuidador: idCuidador,
              tokenAcceso: tokenAcceso,
              onSelection: cambiarApartado,
              onUpdate: obtenerDatosHijo,
            )
          : apartado == "editarContrasena"
          ? Cuidadorperfilactualizarcontrasenascreen(
              idFamiliar: idCuidador,
              tokenAcceso: tokenAcceso,
              onSelection: cambiarApartado,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  SingleChildScrollView perfilPrincipal() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 177, 22),
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
                color: Colors.green,
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
          Perfilopcioneswidget(
            usuario: usuarioCuidador,
            correo: correoCuidador,
            onChanged: cambiarApartado,
          ),
          Perfilinformacionadmwidget(
            nombreCompleto: nombreCFamiliar,
            correo: correoFamiliar,
            direccion: direccionFamiliar,
            telefono1: telefono1Familiar,
            telefono2: telefono2Familiar,
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
                  cerrarSesion(context);
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
    );
  }

  void cerrarSesion(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homescreen()),
    );
  }

  void obtenerDatos() async {
    final repo = CuidadoresRepositoryGlobal();
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    final idCuidador = prefs.getString("IdCuidador");
    final tokenAcceso = prefs.getString("TokenAcceso");
    final result = await repo.obtenerPerfil(
      CuidadoresPerfilObtenerperfil(
        idCuidador: idCuidador ?? "",
        tokenAcceso: tokenAcceso ?? "",
      ),
    );
    setState(() {
      usuarioCuidador = result.usuario ?? "Sin definir";
      correoCuidador = result.correoE ?? "Sin definir";
      nombreCFamiliar =
          "${result.nombreFamiliar ?? ""} ${result.apellidoPFamiliar ?? ""} ${result.apellidoMFamiliar ?? ""}";
      correoFamiliar = result.correoEFamiliar ?? "Sin definir";
      direccionFamiliar = result.direccionFamiliar ?? "Sin definir";
      telefono1Familiar = result.telefono1 ?? "Sin definir";
      telefono2Familiar = result.telefono2 ?? "Sin definir";
    });
  }

  void obtenerDatosSesion() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    setState(() {
      idCuidador = prefs.getString("IdCuidador");
      tokenAcceso = prefs.getString("TokenAcceso");
    });
  }

  void obtenerDatosHijo(String? idCuidador, String? tokenAcceso) async {
    final repo = CuidadoresRepositoryGlobal();
    if (!mounted) {
      return;
    }
    final result = await repo.obtenerPerfil(
      CuidadoresPerfilObtenerperfil(
        idCuidador: idCuidador ?? "",
        tokenAcceso: tokenAcceso ?? "",
      ),
    );
    setState(() {
      usuarioCuidador = result.usuario ?? "Sin definir";
      correoCuidador = result.correoE ?? "Sin definir";
      nombreCFamiliar =
          "${result.nombreFamiliar ?? ""} ${result.apellidoPFamiliar ?? ""} ${result.apellidoMFamiliar ?? ""}";
      correoFamiliar = result.correoEFamiliar ?? "Sin definir";
      direccionFamiliar = result.direccionFamiliar ?? "Sin definir";
      telefono1Familiar = result.telefono1 ?? "Sin definir";
      telefono2Familiar = result.telefono2 ?? "Sin definir";
    });
  }

  void cambiarApartado(String nuevoApartado) {
    if (!mounted) {
      return;
    }
    setState(() {
      apartado = nuevoApartado;
    });
  }
}
