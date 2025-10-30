import 'package:flutter/material.dart';
import 'package:medicare/components/familiares/familiar_pacientes_medicamentos_screen/item_lista_medicamentos.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_obtenermedicamentos.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/screens/familiar/medicamentos/familiar_pacientes_agregarmedicamento_screen.dart';

class FamiliarPacientesMedicamentosScreen extends StatefulWidget {
  final String? idFamiliar;
  final String? tokenAcceso;
  final String? idPaciente;
  final String? nombrePaciente;
  final void Function(String) onSelect;
  const FamiliarPacientesMedicamentosScreen({
    super.key,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.onSelect,
    required this.nombrePaciente,
  });

  @override
  State<FamiliarPacientesMedicamentosScreen> createState() =>
      _FamiliarPacientesMedicamentosScreenState();
}

class _FamiliarPacientesMedicamentosScreenState
    extends State<FamiliarPacientesMedicamentosScreen> {
  String apartado = "defecto";
  Future<FamiliaresPacientesObtenermedicamentosResponse?>? listaMedicamentos;

  @override
  void initState() {
    super.initState();
    obtenerMedicamentos();
  }

  @override
  Widget build(BuildContext context) {
    return apartado == "defecto"
        ? principal()
        : apartado == "agregarMedicamento"
        ? FamiliarPacientesAgregarmedicamentoScreen(
            idFamiliar: widget.idFamiliar,
            tokenAcceso: widget.tokenAcceso,
            idPaciente: widget.idPaciente,
            nombrePaciente: widget.nombrePaciente,
            onSelect: setApartado,
          )
        : CircularProgressIndicator();
  }

  SingleChildScrollView principal() {
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
                  Icons.medication_liquid_sharp,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Medicamentos de ${widget.nombrePaciente}",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            "Administre los medicamentos de su paciente en esta seccion",
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
                  setApartado("agregarMedicamento");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.assignment_add,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    Text(
                      "Agregar nuevo medicamento",
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
                  hintText: "Buscar medicamento",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lista de medicamentos",
                    style: TextStyle(
                      color: Color.fromRGBO(85, 150, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onSelect("defecto");
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder<FamiliaresPacientesObtenermedicamentosResponse?>(
            future: listaMedicamentos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            obtenerMedicamentos();
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
                  snapshot.data?.medicamentos == null ||
                  snapshot.data!.medicamentos.isEmpty) {
                return Center(child: Text('No hay medicamentos registrados'));
              } else {
                final medicamentos = snapshot.data!.medicamentos;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: medicamentos.length,
                  itemBuilder: (context, index) {
                    final medicamento = medicamentos[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: ItemListaMedicamentos(
                        nombreM: medicamento.nombreM ?? "Sin nombre",
                        descripcionM:
                            medicamento.descripcionM ?? "Sin descripcion",
                        tipoM: medicamento.tipoMedicamento ?? "Sin tipo",
                        medicamentoActivo: medicamento.medicamentoActivo,
                        onSelect: setApartado,
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

  void obtenerMedicamentos() async {
    final repo = FamiliaresReposotoryGlobal();
    setState(() {
      if (!mounted) {
        return;
      }
      listaMedicamentos = repo.obtenerMedicamentos(
        FamiliaresPacientesObtenermedicamentos(
          idFamiliar: widget.idFamiliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
          idPaciente: widget.idPaciente ?? "",
        ),
      );
    });
  }

  void setApartado(String nuevoApartado) {
    setState(() {
      apartado = nuevoApartado;
    });
  }
}
