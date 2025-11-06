import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/models/familiares/historial/familiares_historial_obtenermetricasrecordatorios.dart';
import 'package:medicare/models/familiares/historial/familiares_historial_recordatorios.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class FamiliarHistorialRecordatoriosScreen extends StatefulWidget {
  final String? idFamiliar;
  final String? tokenAcceso;

  final void Function(String) onSelect;
  const FamiliarHistorialRecordatoriosScreen({
    super.key,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.onSelect,
  });

  @override
  State<FamiliarHistorialRecordatoriosScreen> createState() =>
      _FamiliarHistorialRecordatoriosScreenState();
}

class _FamiliarHistorialRecordatoriosScreenState
    extends State<FamiliarHistorialRecordatoriosScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controllerNoWifi = AnimationController(
    vsync: this,
  );
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  Future<FamiliaresHistorialRecordatoriosResponse?>? listaRecordatorios;
  String recordatoriosAdministrados = "...";
  String recordatoriosCancelados = "...";
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES', null);
    obtenerRecordatorios();
    obtenerMetricas();
    _controllerNoWifi.duration = const Duration(seconds: 2);
  }

  @override
  void dispose() {
    _controllerNoWifi.dispose();
    super.dispose();
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
                color: Color.fromRGBO(85, 150, 255, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.history_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Historial de Recordatorios",
              style: TextStyle(
                color: Color.fromRGBO(85, 150, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Consulta todos los registros de medicamentos administrados y cancelados",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          metricasComponentes(
            context,
            recordatoriosAdministrados,
            recordatoriosCancelados,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      widget.onSelect("default");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Regresar a la pantalla principal    ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_back, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              locale: "es_Es",
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = selectedDay;
                });
                /*
                print("IdFamiliar: ${widget.idFamiliar}");
                print("IdFamiliar: ${widget.tokenAcceso}");
                print(
                  "Dia seleccionado: ${selectedDay.year}-${selectedDay.month.toString().padLeft(2, "0")}-${selectedDay.day.toString().padLeft(2, "0")}",
                );
                */
              },
              headerStyle: HeaderStyle(formatButtonVisible: false),
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                selectedBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),

          FutureBuilder<FamiliaresHistorialRecordatoriosResponse?>(
            future: listaRecordatorios,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
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
                            obtenerRecordatorios();
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
                  snapshot.data == null ||
                  snapshot.data!.recordatorios.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(child: Text('No hay historial disponible')),
                );
              } else {
                return Column(
                  children: snapshot.data!.recordatorios.map((item) {
                    return itemHistorial(
                      context,
                      item.nombreM,
                      item.estado,
                      item.nombreP,
                      item.nombreCuidador ?? "No asignado",
                      item.dosis,
                      item.administro ?? "Sin datos",
                      item.notas ?? 'sin notas',
                      item.fechaProgramada,
                      item.horaAdministracion ?? "",
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Padding itemHistorial(
    BuildContext context,
    String nombreM,
    String estado,
    String nombreP,
    String nombreC,
    String dosis,
    String administro,
    String notas,
    String fechaProgramada,
    String? fechaAdministrada,
  ) {
    String formateadorFecha(String fechaOriginal) {
      String fechaFormateada = "";
      try {
        DateTime fecha = DateTime.parse(fechaOriginal);
        fechaFormateada += "${fecha.day.toString().padLeft(2, '0')}/";
        switch (fecha.month) {
          case 1:
            fechaFormateada += "Ene/";
            break;
          case 2:
            fechaFormateada += "Feb/";
            break;
          case 3:
            fechaFormateada += "Mar/";
            break;
          case 4:
            fechaFormateada += "Abr/";
            break;
          case 5:
            fechaFormateada += "May/";
            break;
          case 6:
            fechaFormateada += "Jun/";
            break;
          case 7:
            fechaFormateada += "Jul/";
            break;
          case 8:
            fechaFormateada += "Ago/";
            break;
          case 9:
            fechaFormateada += "Sep/";
            break;
          case 10:
            fechaFormateada += "Oct/";
            break;
          case 11:
            fechaFormateada += "Nov/";
            break;
          case 12:
            fechaFormateada += "Dic/";
            break;
        }
        fechaFormateada += "${fecha.year}, ";
        int hora = fecha.hour;
        int minutos = fecha.minute;
        String periodo = "";
        if (hora >= 12) {
          periodo = "PM";
          if (hora > 12) {
            hora -= 12;
          }
        } else {
          periodo = "AM";
          if (hora == 0) {
            hora = 12;
          }
        }
        fechaFormateada +=
            "${hora.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')} $periodo";
      } catch (e) {
        fechaFormateada = fechaOriginal;
      }
      return fechaFormateada;
    }

    return Padding(
      padding: const EdgeInsets.all(25),
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
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: estado == "Cancelado"
                          ? Colors.red[300]
                          : Colors.green[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        estado == "Cancelado"
                            ? Icons.error_outline
                            : Icons.check_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nombreM, style: TextStyle(fontSize: 18)),
                          Container(
                            decoration: BoxDecoration(
                              color: estado == "Cancelado"
                                  ? Colors.red[100]
                                  : Colors.green[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                estado,
                                style: estado == "Cancelado"
                                    ? TextStyle(color: Colors.red)
                                    : TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 220, 235, 247),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paciente",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                nombreP,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              "Cuidador",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            Text(nombreC, style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dosis",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            Text(dosis, style: TextStyle(fontSize: 15)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Administro",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(administro, style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.timer_outlined, color: Colors.grey),
                  ),
                  Text("Programada:", style: TextStyle(color: Colors.grey)),
                  Text(formateadorFecha(fechaProgramada)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        estado == "Cancelado"
                            ? Icons.cancel_sharp
                            : Icons.check_circle_sharp,
                        color: estado == "Cancelado"
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                    estado == "Cancelado"
                        ? Text(
                            "Cancelada",
                            style: TextStyle(color: Colors.grey),
                          )
                        : Text(
                            "Administrada:",
                            style: TextStyle(color: Colors.grey),
                          ),
                    Text(
                      fechaAdministrada != null && fechaAdministrada != ""
                          ? formateadorFecha(fechaAdministrada)
                          : "",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 237, 223),
                  border: Border.all(color: Colors.orange, width: .5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.edit_note_sharp,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          (notas != "" && notas != "null")
                              ? notas
                              : "Sin notas adicionales",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 167, 100, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding metricasComponentes(
    context,
    String nAdministrados,
    String nCancelados,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(111, 200, 230, 201),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(Icons.update, color: Colors.white),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        nAdministrados,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Administrados",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.red[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(110, 230, 200, 200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(Icons.update_disabled_outlined, color: Colors.white),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        nCancelados,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Cancelados",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void obtenerRecordatorios() async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      if (!mounted) {
        return;
      }
      setState(() {
        listaRecordatorios = repo.obtenerHistorialRecordatorios(
          FamiliaresHistorialRecordatorios(
            idFamiliar: widget.idFamiliar ?? "",
            tokenAcceso: widget.tokenAcceso ?? "",
            fechaDatos: "2025-11-03",
          ),
        );
      });
    } catch (e) {
      if (!mounted) {
        return;
      }
      obtenerRecordatorios();
    }
  }

  void obtenerMetricas() async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      final response = await repo.obtenerMetricasRecordatorios(
        FamiliaresHistorialObtenerMetricasRecordatorios(
          idFamiliar: widget.idFamiliar ?? "",
          tokenAcceso: widget.tokenAcceso ?? "",
        ),
      );
      if (!mounted) {
        return;
      }
      setState(() {
        recordatoriosAdministrados = response.recordatoriosAdministrados
            .toString();
        recordatoriosCancelados = response.recordatoriosCancelados.toString();
      });
    } catch (e) {
      if (!mounted) {
        return;
      }
      obtenerMetricas();
    }
  }
}
