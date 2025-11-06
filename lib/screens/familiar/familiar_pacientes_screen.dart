import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/components/familiares/familiar_cuidadores_screen/item_lista_cuidadores.dart';
import 'package:medicare/components/familiares/familiar_pacientes_screen/item_lista_pacientes_screen.dart';
import 'package:medicare/models/pacientes/familiares_pacientes_obtener_pacientes.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/screens/familiar/medicamentos/familiar_pacientes_medicamentos_screen.dart';
import 'package:medicare/screens/familiar/pacientes/familiar_paciente_agregarpaciente_screen.dart';
import 'package:medicare/screens/familiar/pacientes/familiar_paciente_editarpaciente_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamiliarPacientesScreen extends StatefulWidget {
  const FamiliarPacientesScreen({super.key});

  @override
  State<FamiliarPacientesScreen> createState() =>
      _FamiliarPacientesScreenState();
}

class _FamiliarPacientesScreenState extends State<FamiliarPacientesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controllerNoWifi = AnimationController(
    vsync: this,
  );
  late final AnimationController _controllerEmpty = AnimationController(
    vsync: this,
  );
  Future<FamiliaresPacientesObtenerPacientesResponse?>? listaPacientes;
  String? idFamiliar;
  String? tokenAcceso;
  String? idPaciente;
  String? nombrePaciente;
  String seccion = "defecto";

  @override
  void initState() {
    super.initState();
    obtenerDatos();
    _controllerNoWifi.duration = const Duration(seconds: 2);
    _controllerEmpty.duration = const Duration(seconds: 2);
  }

  @override
  void dispose() {
    _controllerNoWifi.dispose();
    _controllerEmpty.dispose();
    super.dispose();
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
                onUpdate: obtenerPacientes,
              )
            : seccion == "editarPaciente"
            ? FamiliarPacienteEditarpacienteScreen(
                idFamiliar: idFamiliar,
                tokenAcceso: tokenAcceso,
                idPaciente: idPaciente,
                onSelect: asignarSeccion,
                onUpdate: obtenerPacientes,
              )
            : seccion == "medicamentosPaciente"
            ? FamiliarPacientesMedicamentosScreen(
                idFamiliar: idFamiliar,
                tokenAcceso: tokenAcceso,
                idPaciente: idPaciente,
                onSelect: asignarSeccion,
                nombrePaciente: nombrePaciente,
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
          FutureBuilder<FamiliaresPacientesObtenerPacientesResponse?>(
            future: listaPacientes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (snapshot.hasError) {
                _controllerNoWifi.reset();
                _controllerNoWifi.forward();
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Lottie.asset(
                          repeat: true,
                          reverse: true,
                          'assets/images/wifierror.json',
                          controller: _controllerNoWifi,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                          onLoaded: (composition) {
                            _controllerNoWifi.duration = composition.duration;
                            _controllerNoWifi.forward();
                          },
                        ),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        "Parece que su conexión está lenta o inestable.",
                        style: TextStyle(
                          color: Colors.red,
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
                            backgroundColor: const Color.fromARGB(
                              255,
                              204,
                              57,
                              46,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            obtenerPacientes(idFamiliar, tokenAcceso);
                          },
                          icon: Icon(Icons.refresh, color: Colors.white),
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
              } else if (!snapshot.hasData ||
                  snapshot.data?.pacientes == null ||
                  snapshot.data!.pacientes!.isEmpty) {
                _controllerEmpty.reset();
                _controllerEmpty.forward();
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Lottie.asset(
                        repeat: true,
                        reverse: true,
                        'assets/images/empty.json',
                        controller: _controllerEmpty,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitWidth,
                        onLoaded: (composition) {
                          _controllerEmpty.duration = composition.duration;
                          _controllerEmpty.forward();
                        },
                      ),
                      Text(
                        "Usted no tiene ningun paciente registrado",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 13, 44, 70),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                final pacientes = snapshot.data!.pacientes!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pacientes.length,
                  itemBuilder: (context, index) {
                    final paciente = pacientes[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: ItemListaPacientesScreen(
                        idCuidador: (paciente.idCuidador != null)
                            ? paciente.idCuidador.toString()
                            : "",
                        idFamliar: idFamiliar ?? "",
                        tokenAcceso: tokenAcceso ?? "",
                        idPaciente: paciente.idPaciente.toString(),
                        nombre: paciente.nombre ?? "",
                        apellidoP: paciente.apellidoP ?? "",
                        apellidoM: paciente.apellidoM ?? "",
                        nombreCuidador: paciente.nombreCuidador ?? "",
                        padecimiento: paciente.padecimiento ?? "",
                        apellidoPCuidador: paciente.apellidoPCuidador ?? "",
                        apellidoMCuidador: paciente.apellidoMCuidador,
                        onSelect: asignarSeccion,
                        onUpdatePaciente: seleccionarPaciente,
                        mostrarDialogoEliminarPaciente: (context, onConfirmar) {
                          mostrarDialogoEliminarPaciente(context, onConfirmar);
                        },
                        onUpdatePacientes: obtenerPacientes,
                        onUpdateNombre: asignarNombrePaciente,
                      ),
                    );
                  },
                );
              }
            },
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
    obtenerPacientes(
      pref.getString("IdUsuario"),
      pref.getString("TokenAcceso"),
    );
  }

  void obtenerPacientes(String? idFamiliar, String? tokenAcceso) async {
    final repo = FamiliaresReposotoryGlobal();
    if (!mounted) {
      return;
    }
    setState(() {
      listaPacientes = repo.obtenerPacientes(
        FamiliaresPacientesObtenerPacientes(
          idFamiliar: idFamiliar ?? "",
          tokenAcceso: tokenAcceso ?? "",
        ),
      );
    });
  }

  asignarSeccion(String seccion) {
    setState(() {
      this.seccion = seccion;
    });
  }

  seleccionarPaciente(String? idPaciente) {
    setState(() {
      this.idPaciente = idPaciente;
    });
  }

  void mostrarDialogoEliminarPaciente(
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

  void asignarNombrePaciente(String nuevoNombrePaciente) {
    if (!mounted) {
      return;
    }
    setState(() {
      nombrePaciente = nuevoNombrePaciente;
    });
  }
}
