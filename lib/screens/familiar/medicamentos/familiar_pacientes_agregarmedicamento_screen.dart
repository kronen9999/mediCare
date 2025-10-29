import 'package:flutter/material.dart';

class FamiliarPacientesAgregarmedicamentoScreen extends StatefulWidget {
  final String? nombrePaciente;
  final void Function(String) onSelect;
  const FamiliarPacientesAgregarmedicamentoScreen({
    super.key,
    required this.nombrePaciente,
    required this.onSelect,
  });

  @override
  State<FamiliarPacientesAgregarmedicamentoScreen> createState() =>
      _FamiliarPacientesAgregarmedicamentoScreenState();
}

class _FamiliarPacientesAgregarmedicamentoScreenState
    extends State<FamiliarPacientesAgregarmedicamentoScreen> {
  String? nombreM;
  String? descripcionM;
  String? tipoMedicamento;
  String? notas;
  String? unidadDosis;
  final List<String> formasMedicamento = [
    'Comprimidos: comprimido(s)',
    'Cápsulas: cápsula(s)',
    'Grageas: gragea(s)',
    'Tabletas',
    'Jarabes: ml',
    'Suspensiones: ml',
    'Elixires: ml',
    'Soluciones: ml',
    'Pomadas: g',
    'Cremas: g',
    'Geles: g',
    'Aerosoles: dosis',
    'Colirios: gota(s)',
    'Óvulos: óvulo(s)',
    'Inhaladores: dosis',
  ];
  String? opcionSeleccionada;
  bool? primerRecordatorio = false;

  @override
  void initState() {
    super.initState();
    opcionSeleccionada = 'systema';
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
                  Icons.assignment_add,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Agregar medicamento",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Agrega un medicamento para ${widget.nombrePaciente}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
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
                border: Border.all(
                  color: Color.fromRGBO(79, 172, 196, 1),
                  width: .5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Informacion del medicamento",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Nombre del medicamento",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            nombreM = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingresa el nombre del medicamento",
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
                          prefixIcon: Icon(
                            Icons.medical_information_outlined,
                            color: Colors.blue,
                          ),
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
                              color: Colors
                                  .blue, // Color del borde cuando está enfocado
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Descripcion del medicamento",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            descripcionM = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Describe el medicamento",
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
                          prefixIcon: Icon(
                            Icons.description_outlined,
                            color: Colors.blue,
                          ),
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
                              color: Colors
                                  .blue, // Color del borde cuando está enfocado
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Tipo de medicamento",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: DropdownButton<String>(
                        value: tipoMedicamento,
                        isExpanded: true,
                        hint: Text('Selecciona el tipo de medicamento'),
                        items: formasMedicamento.map((String valor) {
                          return DropdownMenuItem<String>(
                            value: valor,
                            child: Text(valor),
                          );
                        }).toList(),
                        onChanged: (String? nuevoValor) {
                          setState(() {
                            tipoMedicamento = nuevoValor;
                            switch (tipoMedicamento) {
                              case 'Comprimidos: comprimido(s)':
                                unidadDosis = 'comprimido(s)';
                                break;
                              case 'Cápsulas: cápsula(s)':
                                unidadDosis = 'cápsula(s)';
                                break;
                              case 'Grageas: gragea(s)':
                                unidadDosis = 'gragea(s)';
                                break;
                              case 'Tabletas':
                                unidadDosis = 'tableta(s)';
                                break;
                              case 'Jarabes: ml':
                              case 'Suspensiones: ml':
                              case 'Elixires: ml':
                              case 'Soluciones: ml':
                                unidadDosis = 'ml';
                                break;
                              case 'Pomadas: g':
                              case 'Cremas: g':
                              case 'Geles: g':
                                unidadDosis = 'g';
                                break;
                              case 'Aerosoles: dosis':
                              case 'Inhaladores: dosis':
                                unidadDosis = 'dosis';
                                break;
                              case 'Colirios: gota(s)':
                                unidadDosis = 'gota(s)';
                                break;
                              case 'Óvulos: óvulo(s)':
                                unidadDosis = 'óvulo(s)';
                                break;
                              default:
                                unidadDosis = null;
                                break;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Notas del medicamento",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            //    direccion = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Agregue notas del medicamento",
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
                          prefixIcon: Icon(
                            Icons.notes_outlined,
                            color: Colors.blue,
                          ),
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
                              color: Colors
                                  .blue, // Color del borde cuando está enfocado
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              width: double.infinity,
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
                border: Border.all(
                  color: Color.fromRGBO(79, 172, 196, 1),
                  width: .5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Dosis y horario del medicamento",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Hora de la primera dosis",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    RadioListTile<String>(
                      title: Text('Hora actual'),
                      value: 'systema',
                      activeColor: Colors.blue,
                      groupValue: opcionSeleccionada,
                      onChanged: (String? value) {
                        setState(() {
                          opcionSeleccionada = value;
                        });
                      },
                    ),
                    (opcionSeleccionada == "systema")
                        ? Text(
                            "Se calculará el horario de la siguiente dosis en base a la hora actual. Recomendable si se va a dar el medicamento en este momento.",
                            style: TextStyle(color: Colors.blue),
                          )
                        : SizedBox(),
                    RadioListTile<String>(
                      title: Text('Programar con retardo'),
                      value: 'retardo',
                      activeColor: Colors.blue,
                      groupValue: opcionSeleccionada,
                      onChanged: (String? value) {
                        setState(() {
                          opcionSeleccionada = value;
                        });
                      },
                    ),
                    (opcionSeleccionada == "retardo")
                        ? SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Tiempo de retardo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                "Horas",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 2,
                                                onChanged: (value) {
                                                  setState(() {
                                                    //  usuario = value;
                                                  });
                                                },
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromARGB(
                                                        109,
                                                        236,
                                                        230,
                                                        230,
                                                      ),
                                                  hintText: "Hr(s)",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                        79,
                                                        172,
                                                        196,
                                                        1,
                                                      ),
                                                      width: .5,
                                                    ),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.timer_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .blue, // Color del borde cuando está enfocado
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                "Minutos",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 2,
                                                onChanged: (value) {
                                                  setState(() {
                                                    //  usuario = value;
                                                  });
                                                },
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromARGB(
                                                        109,
                                                        236,
                                                        230,
                                                        230,
                                                      ),
                                                  hintText: "Min(s)",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                        79,
                                                        172,
                                                        196,
                                                        1,
                                                      ),
                                                      width: .5,
                                                    ),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.timer_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .blue, // Color del borde cuando está enfocado
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 20, top: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "Hora de inicio programada",
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Text(
                                            "12:30 PM",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                255,
                                                24,
                                                103,
                                                168,
                                              ),
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      fillColor: WidgetStatePropertyAll(
                                        Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                      ),
                                      checkColor: Colors.blue,
                                      value: primerRecordatorio,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          primerRecordatorio = value ?? false;
                                        });
                                      },
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 240,
                                          child: Text(
                                            "Establecer primer recordatorio",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 240,
                                          child: Text(
                                            "Si no se coloca la alarma, se establecerá en el intervalo de tiempo calculado a partir de la hora programada.",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(color: Colors.grey, height: 50),
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Intervalos de tiempo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Horas",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    maxLength: 2,
                                    onChanged: (value) {
                                      setState(() {
                                        //  usuario = value;
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                        109,
                                        236,
                                        230,
                                        230,
                                      ),
                                      hintText: "Hr(s)",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                            79,
                                            172,
                                            196,
                                            1,
                                          ),
                                          width: .5,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.timer_outlined,
                                        color: Colors.blue,
                                      ),
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
                                          color: Colors
                                              .blue, // Color del borde cuando está enfocado
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Minutos",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    maxLength: 2,
                                    onChanged: (value) {
                                      setState(() {
                                        //  usuario = value;
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                        109,
                                        236,
                                        230,
                                        230,
                                      ),
                                      hintText: "Min(s)",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                            79,
                                            172,
                                            196,
                                            1,
                                          ),
                                          width: .5,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.timer_outlined,
                                        color: Colors.blue,
                                      ),
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
                                          color: Colors
                                              .blue, // Color del borde cuando está enfocado
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Especifica cada cuánto tiempo se debe tomar el medicamento",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Unidad de medida (${unidadDosis ?? "No especificada"})",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            //  contrasena = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(109, 236, 230, 230),
                          hintText: "Ingrese la cantidad de ingesta",
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
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: Colors.blue,
                          ),
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
                              color: Colors
                                  .blue, // Color del borde cuando está enfocado
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Guardar medicamento",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: TextButton(
                onPressed: () {
                  widget.onSelect("defecto");
                },
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
