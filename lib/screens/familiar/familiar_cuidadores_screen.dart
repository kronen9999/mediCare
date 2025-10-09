import 'package:flutter/material.dart';
import 'package:medicare/components/familiares/familiar_cuidadores_screen/item_lista_cuidadores.dart';
import 'package:medicare/models/familiares/admcuidadores/familiares_cuidadores_obtener_cuidadores.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/screens/familiar/cuidadores/familiar_admcuidadores_agregar_cuidador_widget.dart';
import 'package:medicare/screens/familiar/cuidadores/familiar_admcuidadores_editar_cuidador_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamiliarCuidadoresScreen extends StatefulWidget {
  const FamiliarCuidadoresScreen({super.key});

  @override
  State<FamiliarCuidadoresScreen> createState() =>
      _FamiliarCuidadoresScreenState();
}

class _FamiliarCuidadoresScreenState extends State<FamiliarCuidadoresScreen> {
  String? idUsuario;
  String? tokenAcceso;
  String apartado = "default";
  String idCuidadorEditar = "";
  Future<FamiliaresCuidadoresObtenerCuidadoresResponse?>? listaCuidadores;

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
        child: apartado == "default"
            ? contenidoBasico()
            : apartado == "agregarCuidador"
            ? FamiliarAdmcuidadoresAgregarCuidadorWidget(
                onSelect: asignarSeccion,
                idFamiliar: idUsuario ?? "",
                tokenAcceso: tokenAcceso ?? "",
                onUpdate: obtenerCuidadoresHijo,
              )
            : apartado == "editarCuidador"
            ? FamiliarAdmcuidadoresEditarCuidadorWidget(
                idFamiliar: idUsuario ?? "",
                tokenAcceso: tokenAcceso ?? "",
                idCuidador: idCuidadorEditar,
                onSelect: asignarSeccion,
                onUpdate: obtenerCuidadoresHijo,
              )
            : Center(child: Text("sin seccion")),
      ),
    );
  }

  SingleChildScrollView contenidoBasico() {
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
              "Gestionar cuidadores",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Administra tu equipo de cuidadores",
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
                  asignarSeccion("agregarCuidador");
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
                      "Agregar nuevo cuidador",
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
                  hintText: "Buscar cuidador",
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
                "Lista de cuidadores",
                style: TextStyle(
                  color: Color.fromRGBO(85, 150, 255, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // ...dentro de tu método contenidoBasico() o directamente en el build...
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child:
                  FutureBuilder<FamiliaresCuidadoresObtenerCuidadoresResponse?>(
                    future: listaCuidadores,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.wifi_off, color: Colors.red, size: 40),
                              const SizedBox(height: 16),
                              Text(
                                "Parece que su conexión está lenta o inestable.",
                                style: TextStyle(
                                  color: Color.fromRGBO(85, 150, 255, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 180,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  onPressed: () {
                                    obtenerCuidadores();
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Reintentar",
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
                        );
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final cuidadores = snapshot.data!.cuidadores;
                        if (cuidadores.isEmpty) {
                          return Center(
                            child: Text('No hay cuidadores registrados.'),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cuidadores.length,
                          itemBuilder: (context, index) {
                            final cuidador = cuidadores[index];
                            return ItemListaCuidadores(
                              idCuidador: cuidador.idCuidador.toString(),
                              idFamiliar: idUsuario ?? "",
                              tokenAcceso: tokenAcceso ?? "",
                              nombre: cuidador.nombre ?? "",
                              apellidoP: cuidador.apellidoP ?? "",
                              apellidoM: cuidador.apellidoM ?? "",
                              pacienteAsignado: cuidador.pacienteAsignado ?? "",
                              usuarioCuidador: cuidador.usuario ?? "",
                              telefono1: cuidador.telefono1,
                              correoE: cuidador.correoE,
                              onEdit: seleccionarCuidadorParaEditar,
                              onDelete: (context, onConfirmar) {
                                mostrarDialogoEliminarCuidador(
                                  context,
                                  onConfirmar,
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('No hay datos'));
                      }
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void obtenerDatos() async {
    final pref = await SharedPreferences.getInstance();
    final prefIdUsuario = pref.getString('IdUsuario') ?? '';
    final prefTokenAcceso = pref.getString('TokenAcceso') ?? '';
    setState(() {
      idUsuario = prefIdUsuario;
      tokenAcceso = prefTokenAcceso;
    });
    obtenerCuidadores();
  }

  void obtenerCuidadores() async {
    final repo = FamiliaresReposotoryGlobal();
    if (!mounted) return;
    setState(() {
      listaCuidadores = repo.obtenerCuidadores(
        FamiliaresCuidadoresObtenerCuidadores(
          idFamiliar: idUsuario ?? "",
          tokenAcceso: tokenAcceso ?? "",
        ),
      );
    });
  }

  void obtenerCuidadoresHijo(String idFamiliar, String tokenAcceso) async {
    final repo = FamiliaresReposotoryGlobal();
    if (!mounted) return;
    setState(() {
      listaCuidadores = repo.obtenerCuidadores(
        FamiliaresCuidadoresObtenerCuidadores(
          idFamiliar: idFamiliar,
          tokenAcceso: tokenAcceso,
        ),
      );
    });
  }

  void asignarSeccion(String seccion) {
    setState(() {
      apartado = seccion;
    });
  }

  void seleccionarCuidadorParaEditar(String idCuidador) {
    setState(() {
      idCuidadorEditar = idCuidador;
      apartado = "editarCuidador";
    });
  }

  void mostrarDialogoEliminarCuidador(
    BuildContext context,
    VoidCallback onConfirmar,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmar eliminación"),
        content: Text("¿Está seguro que desea eliminar a este cuidador?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Cierra el diálogo
            child: Text("Cancelar", style: TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
              onConfirmar(); // Ejecuta la acción de eliminar
            },
            child: Text("Eliminar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
