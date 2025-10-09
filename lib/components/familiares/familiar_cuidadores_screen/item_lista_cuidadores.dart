import 'package:flutter/material.dart';

class ItemListaCuidadores extends StatefulWidget {
  final String idCuidador;
  final String idFamiliar;
  final String tokenAcceso;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String pacienteAsignado;
  final String usuarioCuidador;
  final String? telefono1;
  final String? correoE;
  final void Function(BuildContext context, VoidCallback onConfirmar)? onDelete;
  final void Function(String) onEdit;
  const ItemListaCuidadores({
    super.key,
    required this.idCuidador,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.pacienteAsignado,
    required this.usuarioCuidador,
    required this.telefono1,
    this.correoE,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<ItemListaCuidadores> createState() => _ItemListaCuidadoresState();
}

class _ItemListaCuidadoresState extends State<ItemListaCuidadores> {
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
                      width: 250,
                      child: Text(
                        "${widget.nombre} ${widget.apellidoP} ${widget.apellidoM}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              widget.onEdit(widget.idCuidador);
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: const Color.fromARGB(255, 102, 101, 101),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.onDelete != null) {
                              widget.onDelete!(context, () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Cuidador eliminado')),
                                );
                              });
                            }
                          },
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: const Color.fromARGB(255, 102, 101, 101),
                          ),
                        ),
                      ],
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
                      Icon(Icons.person, size: 18, color: Colors.grey),
                      Text("  ${widget.usuarioCuidador}"),
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
                      Icon(Icons.phone, size: 18, color: Colors.grey),
                      Text(
                        "  ${(widget.telefono1 == null || widget.telefono1 == "") ? 'No proporcionado' : widget.telefono1}",
                      ),
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
                      Icon(Icons.mail, size: 18, color: Colors.grey),
                      Text(
                        "  ${(widget.correoE == null || widget.correoE == "") ? 'No proporcionado' : widget.correoE}",
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.pacienteAsignado == "Asignado"
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
