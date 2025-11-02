import 'package:flutter/material.dart';

class ItemListaRecordatoriosproximos extends StatefulWidget {
  final String idMedicamento;
  final String nombreM;
  final String nombreP;
  final String? nombreC;
  final String dosis;
  final String unidadDosis;
  final String? notas;
  final String? fechaAdministracion;
  const ItemListaRecordatoriosproximos({
    super.key,
    required this.idMedicamento,
    required this.nombreM,
    required this.nombreP,
    required this.nombreC,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
    required this.fechaAdministracion,
  });

  @override
  State<ItemListaRecordatoriosproximos> createState() =>
      _ItemListaRecordatoriosproximosState();
}

class _ItemListaRecordatoriosproximosState
    extends State<ItemListaRecordatoriosproximos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 15),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.timer_outlined, color: Colors.blue, size: 22),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.fechaAdministracion ?? "Sin fecha",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Paciente: ${widget.nombreP}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Cuidador asignado: ${widget.nombreC}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.medical_information_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 210,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nombreM,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 16, 71, 116),
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                "Dosis: ${widget.dosis} ${widget.unidadDosis}",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Text(
                              widget.notas ?? "Sin notas",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.done, color: Colors.white),
                          ),
                          Text(
                            "Registrar administracion",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.red),
                ),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Cancelar administracion",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
