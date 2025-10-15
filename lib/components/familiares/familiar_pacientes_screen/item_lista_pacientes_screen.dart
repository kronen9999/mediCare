import 'package:flutter/material.dart';
import 'package:medicare/models/familiares/admcuidadores/familiares_cuidadores_obtener_cuidadoresna.dart';
import 'package:medicare/models/pacientes/familiar_pacientes_asignar_cuidador.dart';
import 'package:medicare/models/pacientes/familiar_pacientes_desasignar_cuidador.dart';
import 'package:medicare/models/pacientes/familiar_pacientes_eliminar_paciente.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';

class ItemListaPacientesScreen extends StatefulWidget {
  final String? idFamliar;
  final String? tokenAcceso;
  final String? idPaciente;
  final String? nombre;
  final String? apellidoP;
  final String? apellidoM;
  final String? idCuidador;
  final String? padecimiento;
  final String? nombreCuidador;
  final String? apellidoPCuidador;
  final String? apellidoMCuidador;
  final void Function(String) onSelect;
  final void Function(String?) onUpdatePaciente;
  final void Function(String?, String?) onUpdatePacientes;
  final void Function(BuildContext, VoidCallback)
  mostrarDialogoEliminarPaciente;
  const ItemListaPacientesScreen({
    super.key,
    required this.idFamliar,
    required this.tokenAcceso,
    required this.idCuidador,
    required this.idPaciente,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.padecimiento,
    required this.nombreCuidador,
    required this.apellidoPCuidador,
    required this.apellidoMCuidador,
    required this.onSelect,
    required this.onUpdatePaciente,
    required this.mostrarDialogoEliminarPaciente,
    required this.onUpdatePacientes,
  });

  @override
  State<ItemListaPacientesScreen> createState() =>
      _ItemListaPacientesScreenState();
}

class _ItemListaPacientesScreenState extends State<ItemListaPacientesScreen> {
  Future<FamiliaresCuidadoresObtenerCuidadoresnaResponse?>? listaCuidadoresNA;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
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
          border: Border.all(color: Color.fromRGBO(79, 172, 196, 1), width: .5),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "${widget.nombre} ${widget.apellidoP} ${widget.apellidoM}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      (widget.padecimiento != null &&
                              widget.padecimiento != "null" &&
                              widget.padecimiento != "")
                          ? Text("  ${widget.padecimiento}")
                          : Text("  Sin padecimiento"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 18, color: Colors.grey),
                      (widget.idCuidador != null &&
                              widget.idCuidador != "null" &&
                              widget.idCuidador != "")
                          ? Text(
                              "  ${widget.nombreCuidador} ${widget.apellidoMCuidador} ${widget.apellidoPCuidador}",
                            )
                          : Text("  Sin datos del cuidador"),
                    ],
                  ),
                ),
              ),
              Divider(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        widget.onUpdatePaciente(widget.idPaciente ?? "");
                        widget.onSelect("editarPaciente");
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: const Color.fromARGB(255, 102, 101, 101),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        widget.mostrarDialogoEliminarPaciente(context, () {
                          eliminarPaciente(context);
                        });
                      },
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: const Color.fromARGB(255, 102, 101, 101),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.medication_liquid,
                        color: const Color.fromARGB(255, 102, 101, 101),
                      ),
                    ),
                  ),
                  (widget.idCuidador != null &&
                          widget.idCuidador != "" &&
                          widget.idCuidador != "null")
                      ? GestureDetector(
                          onTap: () {
                            mostrarDialogoDesasignarC();
                          },
                          child: Icon(
                            Icons.person_add_disabled_outlined,
                            color: const Color.fromARGB(255, 102, 101, 101),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            obtenerListaCuidadoresNa();
                            mostrarDialogoSeleccionarCuidador(context);
                          },
                          child: Icon(
                            Icons.person_add_alt_outlined,
                            color: const Color.fromARGB(255, 102, 101, 101),
                          ),
                        ),
                  Spacer(),
                  (widget.idCuidador != null &&
                          widget.idCuidador != "" &&
                          widget.idCuidador != "null")
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "Asignado",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 94, 94, 94),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "No asignado",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 94, 94, 94),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void eliminarPaciente(context) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      final result = await repo.eliminarPaciente(
        FamiliarPacientesEliminarPaciente(
          idFamiliar: widget.idFamliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idPaciente: widget.idPaciente ?? "",
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      widget.onSelect("default");
      widget.onUpdatePacientes(widget.idFamliar, widget.tokenAcceso);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  void mostrarDialogoSeleccionarCuidador(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Seleccionar cuidador",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SizedBox(
            height: 250,
            child: FutureBuilder<FamiliaresCuidadoresObtenerCuidadoresnaResponse?>(
              future: listaCuidadoresNA,
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
                      ],
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final cuidadores = snapshot.data!.cuidadoresNoAsignados;
                  if (cuidadores.isEmpty) {
                    return Text('No hay cuidadores disponibles.');
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cuidadores.length,
                    itemBuilder: (context, index) {
                      final cuidador = cuidadores[index];
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          '${cuidador.nombre} ${cuidador.apellidoP} ${cuidador.apellidoM}',
                        ),
                        subtitle: Text("No asignado"),
                        onTap: () {
                          asignarPaciente(
                            cuidador.idCuidador.toString(),
                            context,
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Text('No hay datos');
                }
              },
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  void obtenerListaCuidadoresNa() async {
    final repo = FamiliaresReposotoryGlobal();
    if (!mounted) {
      return;
    }
    setState(() {
      listaCuidadoresNA = repo.obtenerCuidadoresNa(
        FamiliaresCuidadoresObtenerCuidadoresna(
          idFamiliar: widget.idFamliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
        ),
      );
    });
  }

  void asignarPaciente(String? idCuidador, context) async {
    final repo = FamiliaresReposotoryGlobal();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Center(child: CircularProgressIndicator(color: Colors.blue)),
    );
    try {
      final result = await repo.asignarCuidador(
        FamiliarPacientesAsignarCuidador(
          idFamiliar: widget.idFamliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idPaciente: widget.idPaciente ?? "",
          idCuidador: idCuidador ?? "",
        ),
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      // Actualiza la lista después de asignar
      widget.onUpdatePacientes(widget.idFamliar, widget.tokenAcceso);
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  void mostrarDialogoDesasignarC() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Desasignar cuidador"),
        content: Text(
          "¿Está seguro que desea desasignar el cuidador ${widget.nombreCuidador} ${widget.apellidoPCuidador} ${widget.apellidoMCuidador}?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Cierra el diálogo
            child: Text("Cancelar", style: TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              desasignarCuidador(context);
              // Cierra el diálogo
            },
            child: Text("Deasignar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void desasignarCuidador(context) async {
    final repo = FamiliaresReposotoryGlobal();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Center(child: CircularProgressIndicator(color: Colors.blue)),
    );
    try {
      final result = await repo.desasignarCuidador(
        FamiliarPacientesDesasignarCuidador(
          idFamiliar: widget.idFamliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idPaciente: widget.idPaciente ?? "",
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      Navigator.of(context).pop();
      // Actualiza la lista después de desasignar
      widget.onUpdatePacientes(widget.idFamliar, widget.tokenAcceso);
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString().replaceAll("Exception: ", "")),
        ),
      );
    }
  }
}
