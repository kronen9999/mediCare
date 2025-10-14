import 'package:flutter/material.dart';

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
  });

  @override
  State<ItemListaPacientesScreen> createState() =>
      _ItemListaPacientesScreenState();
}

class _ItemListaPacientesScreenState extends State<ItemListaPacientesScreen> {
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
                      onTap: () {},
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
                          onTap: () {},
                          child: Icon(
                            Icons.person_add_disabled_outlined,
                            color: const Color.fromARGB(255, 102, 101, 101),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {},
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
}
