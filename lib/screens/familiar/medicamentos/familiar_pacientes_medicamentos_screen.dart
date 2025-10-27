import 'package:flutter/material.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_obtenermedicamentos.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';

class FamiliarPacientesMedicamentosScreen extends StatefulWidget {
  final String? idFamiliar;
  final String? tokenAcceso;
  final String? idPaciente;
  final void Function(String) onSelect;
  const FamiliarPacientesMedicamentosScreen({
    super.key,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.onSelect,
  });

  @override
  State<FamiliarPacientesMedicamentosScreen> createState() =>
      _FamiliarPacientesMedicamentosScreenState();
}

class _FamiliarPacientesMedicamentosScreenState
    extends State<FamiliarPacientesMedicamentosScreen> {
  Future<FamiliaresPacientesObtenermedicamentosResponse?>? listaMedicamentos;

  @override
  void initState() {
    super.initState();
    obtenerMedicamentos();
  }

  @override
  Widget build(BuildContext context) {
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
              "Medicamentos de Alejandro",
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
                  // asignarSeccion("agregarPaciente");
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
}
