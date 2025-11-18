import 'package:flutter/material.dart';
import 'package:medicare/models/cuidadores/home/cuidador_administrarmedicamento.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_administrarmedicamento.dart';
import 'package:medicare/models/familiares/medicamentos/familiares_pacientes_cancelaradministracionmedicamento.dart';
import 'package:medicare/repositories/cuidadores/cuidadores_repository_global.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';
import 'package:medicare/main.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ItemListaRecordatoriosproximos extends StatefulWidget {
  final String? idCuidador;
  final String? tokenAcceso;
  final String idHistorial;
  final String nombreM;
  final String nombreP;
  final String dosis;
  final String unidadDosis;
  final String? notas;
  final String? fechaAdministracion;
  final void Function(String, String) onUpdateRecordatorios;
  const ItemListaRecordatoriosproximos({
    super.key,
    required this.idCuidador,
    required this.tokenAcceso,
    required this.idHistorial,
    required this.nombreM,
    required this.nombreP,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
    required this.fechaAdministracion,
    required this.onUpdateRecordatorios,
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
          border: Border.all(color: Color.fromRGBO(112, 196, 79, 1), width: .5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.timer_outlined, color: Colors.green, size: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.fechaAdministracion ?? "Sin fecha",
                      style: TextStyle(color: Colors.green, fontSize: 16.5),
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
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.green[50],
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
                          color: Colors.green,
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
                                color: const Color.fromARGB(255, 16, 116, 24),
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                "Dosis: ${widget.dosis} ${widget.unidadDosis}",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            Text(
                              widget.notas ?? "Sin notas",
                              style: TextStyle(color: Colors.green),
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
                      onPressed: () {
                        administrarMedicamento(context);
                      },
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
            ],
          ),
        ),
      ),
    );
  }

  void administrarMedicamento(context) async {
    final fechaHoraActual = DateTime.now();
    final repo = CuidadoresRepositoryGlobal();
    showDialog(
      context: context,
      builder: (_) =>
          Center(child: CircularProgressIndicator(color: Colors.green)),
      barrierDismissible: false,
    );
    try {
      final result = await repo.administrarMedicamento(
        CuidadorAdministrarmedicamento(
          idCuidador: widget.idCuidador!,
          tokenAcceso: widget.tokenAcceso!,
          idHistorial: widget.idHistorial,
          fechaAdministracion:
              "${fechaHoraActual.year}-${fechaHoraActual.month.toString().padLeft(2, '0')}-${fechaHoraActual.day.toString().padLeft(2, '0')} ${fechaHoraActual.hour.toString().padLeft(2, '0')}:${fechaHoraActual.minute.toString().padLeft(2, '0')}:${fechaHoraActual.second.toString().padLeft(2, '0')}",
        ),
      );
      if (result.fechaSiguienteDosis != null) {
        await agregarNotificacion(
          int.parse(widget.idHistorial),
          widget.nombreM,
          widget.nombreP,
          result.fechaSiguienteDosis!,
        );
      }
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message), backgroundColor: Colors.green),
      );
      widget.onUpdateRecordatorios(
        widget.idCuidador ?? "",
        widget.tokenAcceso ?? "",
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
          content: Text(message.replaceAll("Exception: ", "")),
          backgroundColor: Colors.red,
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
