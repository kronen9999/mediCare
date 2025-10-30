import 'package:flutter/material.dart';

class ItemListaMedicamentos extends StatefulWidget {
  final String nombreM;
  final String? descripcionM;
  final String? tipoM;
  final int medicamentoActivo;
  final void Function(String) onSelect;
  const ItemListaMedicamentos({
    super.key,
    required this.nombreM,
    required this.descripcionM,
    required this.tipoM,
    required this.medicamentoActivo,
    required this.onSelect,
  });

  @override
  State<ItemListaMedicamentos> createState() => _ItemListaMedicamentosState();
}

class _ItemListaMedicamentosState extends State<ItemListaMedicamentos> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nombreM,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.onSelect("editarMedicamento");
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: Color.fromARGB(255, 102, 101, 101),
                            ),
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: Color.fromARGB(255, 102, 101, 101),
                          ),
                        ],
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
                      Text(widget.tipoM ?? "Tipo no especificado"),
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
                      Icon(
                        Icons.description_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      Text(
                        widget.descripcionM == null || widget.descripcionM == ""
                            ? "Sin descripcion del medicamento"
                            : widget.descripcionM ?? "Sin descripcion",
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 30),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      widget.medicamentoActivo == 1
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  "Activo",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      94,
                                      94,
                                      94,
                                    ),
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
                                  "Inactivo",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      94,
                                      94,
                                      94,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  Row(
                    children: [
                      widget.medicamentoActivo == 1
                          ? TextButton(
                              onPressed: () {},
                              child: Text(
                                "Deshabilitar medicamento",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : TextButton(
                              onPressed: () {},
                              child: Text(
                                "Habilitar medicamento",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                    ],
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
