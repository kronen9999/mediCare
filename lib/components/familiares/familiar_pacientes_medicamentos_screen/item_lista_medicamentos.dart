import 'package:flutter/material.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_medicamentos_eliminarmedicamento.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_desabilitarmedicamento.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_habilitarmedicamento.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:medicare/main.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ItemListaMedicamentos extends StatefulWidget {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;
  final String nombreM;
  final String? descripcionM;
  final String? tipoM;
  final int medicamentoActivo;
  final void Function(String) onSelect;
  final void Function(String) setIdMedicamento;
  final void Function() updateMedicamento;
  const ItemListaMedicamentos({
    super.key,
    required this.nombreM,
    required this.descripcionM,
    required this.tipoM,
    required this.medicamentoActivo,
    required this.onSelect,
    required this.setIdMedicamento,
    required this.idMedicamento,
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.updateMedicamento,
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
                              widget.setIdMedicamento(widget.idMedicamento);
                              widget.onSelect("editarMedicamento");
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: Color.fromARGB(255, 102, 101, 101),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              mostrarDialogoEliminarMedicamento(context);
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromARGB(255, 102, 101, 101),
                            ),
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
                              onPressed: () {
                                mostrarDialogoDesabilitarMedicamento(context);
                              },
                              child: Text(
                                "Deshabilitar medicamento",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                mostrarDialogoHabilitarMedicamento(context);
                              },
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

  void mostrarDialogoDesabilitarMedicamento(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Deshabilitar medicamento"),
        content: Text(
          "¿Estás seguro de que deseas deshabilitar este medicamento?Ten en cuenta que desabilitarlo no lo borra,pero no generara mas recordatorios.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancelar", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              desabilitarMedicamento(context);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red),
            ),
            child: Text("Deshabilitar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void mostrarDialogoHabilitarMedicamento(BuildContext context) {
    int valueHoras = 0;
    int valueMinutos = 5;
    final hoy = DateTime.now();
    var hoyFinal = hoy.add(Duration(minutes: 5));
    String horaLabel = "";

    void formatearHorario(int horas, int minutos) {
      final dt = DateTime(0, 1, 1, horas, minutos);
      int hora12 = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
      String periodo = dt.hour < 12 ? 'AM' : 'PM';
      String minutosStr = dt.minute.toString().padLeft(2, '0');
      setState(() {
        horaLabel = "$hora12:$minutosStr $periodo";
      });
    }

    formatearHorario(hoyFinal.hour, hoyFinal.minute);
    void aumentarDisminuirTiempo(int horas, int minutos) {
      final fechaCalculada = hoy.add(Duration(hours: horas, minutes: minutos));
      hoyFinal = fechaCalculada;
      int hora = fechaCalculada.hour;
      int minuto = fechaCalculada.minute;
      formatearHorario(hora, minuto);
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text("Habilitar medicamento"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Al activar un medicamento se generara un recordatorio en la hora y minutos que usted especifique",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Horas : $valueHoras'),
                        NumberPicker(
                          itemHeight: 30,
                          minValue: 0,
                          maxValue: 24,
                          value: valueHoras,
                          onChanged: (value) {
                            setState(() => valueHoras = value);
                            aumentarDisminuirTiempo(value, valueMinutos);
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Minutos : $valueMinutos'),
                        NumberPicker(
                          itemHeight: 30,
                          minValue: 5,
                          maxValue: 60,
                          value: valueMinutos,
                          onChanged: (value) {
                            setState(() => valueMinutos = value);
                            aumentarDisminuirTiempo(valueHoras, value);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "$horaLabel",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancelar", style: TextStyle(color: Colors.green)),
              ),
              ElevatedButton(
                onPressed: () {
                  habilitarMedicamento(
                    hoyFinal.year.toString().padLeft(4, '0'),
                    hoyFinal.month.toString().padLeft(2, '0'),
                    hoyFinal.day.toString().padLeft(2, '0'),
                    hoyFinal.hour.toString().padLeft(2, '0'),
                    hoyFinal.minute.toString().padLeft(2, '0'),
                    hoyFinal.second.toString().padLeft(2, '0'),
                    context,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                ),
                child: Text("Habilitar", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  desabilitarMedicamento(context) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      showDialog(
        context: context,
        builder: (_) =>
            Center(child: CircularProgressIndicator(color: Colors.blue)),
        barrierDismissible: false,
      );
      final result = await repo.desabilitarMedicamento(
        FamiliaresPacientesDesabilitarmedicamento(
          idFamiliar: widget.idFamiliar,
          tokenAcceso: widget.tokenAcceso,
          idPaciente: widget.idPaciente,
          idMedicamento: widget.idMedicamento,
        ),
      );
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      widget.updateMedicamento();
    } catch (e) {
      Navigator.of(context).pop();
      String message = e.toString();
      if (message.startsWith("ClientException")) {
        message =
            "Error de conexión. Por favor, verifica tu conexión a internet e intentalo de nuevo.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message.replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  void habilitarMedicamento(
    String year,
    String month,
    String day,
    String hour,
    String min,
    String sec,
    context,
  ) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      showDialog(
        context: context,
        builder: (_) =>
            Center(child: CircularProgressIndicator(color: Colors.blue)),
        barrierDismissible: false,
      );
      final result = await repo.habilitarMedicamento(
        FamiliaresPacientesHabilitarmedicamento(
          idFamiliar: widget.idFamiliar,
          tokenAcceso: widget.tokenAcceso,
          idPaciente: widget.idPaciente,
          idMedicamento: widget.idMedicamento,
          horaCalculo: "$year-$month-$day $hour:$min:$sec",
        ),
      );
      await agregarNotificacion(
        result.historialMedicamento,
        result.nombreM,
        result.nombreP,
        result.fechaSiguienteDosis,
      );
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
      widget.updateMedicamento();
    } catch (e) {
      Navigator.of(context).pop();
      String message = e.toString();
      if (message.startsWith("ClientException")) {
        message =
            "Error de conexión. Por favor, verifica tu conexión a internet e intentalo de nuevo.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message.replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  void mostrarDialogoEliminarMedicamento(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmar eliminacion"),
        content: Text(
          "¿Estás seguro de que deseas eliminar este medicamento?Ten en cuenta que al eliminarlo no podras recuperarlo.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancelar", style: TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            onPressed: () {
              eliminarMedicamento(context);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            child: Text("Eliminar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void eliminarMedicamento(context) async {
    final repo = FamiliaresReposotoryGlobal();
    try {
      showDialog(
        context: context,
        builder: (_) =>
            Center(child: CircularProgressIndicator(color: Colors.blue)),
        barrierDismissible: false,
      );
      final result = await repo.eliminarMedicamento(
        FamiliaresMedicamentosEliminarmedicamento(
          idFamiliar: widget.idFamiliar,
          tokenAcceso: widget.tokenAcceso,
          idPaciente: widget.idPaciente,
          idMedicamento: widget.idMedicamento,
        ),
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      widget.updateMedicamento();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(result.message)),
      );
    } catch (e) {
      Navigator.of(context).pop();
      String message = e.toString();
      if (message.startsWith("ClientException")) {
        message =
            "Error de conexión. Por favor, verifica tu conexión a internet e intentalo de nuevo.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message.replaceAll("Exception: ", "")),
        ),
      );
    }
  }

  Future<void> agregarNotificacion(
    int idHistorial,
    String nombreMedicamento,
    String nombrePaciente,
    String horaRecordatorio,
  ) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      idHistorial,
      "Es hora de suministrar {$nombreMedicamento}",
      "Es hora de dar el medicamento a $nombrePaciente",
      tz.TZDateTime.parse(tz.local, horaRecordatorio),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'medicare_channel_01',
          'Recordatorios',
          channelDescription: 'Canal para recordatorios de medicamentos',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
