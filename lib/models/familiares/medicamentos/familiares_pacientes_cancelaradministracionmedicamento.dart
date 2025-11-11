class FamiliaresPacientesCancelaradministracionmedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idHistorial;
  final String fechaCancelacion;

  FamiliaresPacientesCancelaradministracionmedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idHistorial,
    required this.fechaCancelacion,
  });

  factory FamiliaresPacientesCancelaradministracionmedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesCancelaradministracionmedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idHistorial: json['IdHistorial'].toString(),
      fechaCancelacion: json['FechaCancelacion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdHistorial': idHistorial,
      'FechaCancelacion': fechaCancelacion,
    };
  }
}

class FamiliaresPacientesCancelaradministracionmedicamentoResponse {
  String message;
  String? fechaSiguienteDosis;
  String? nombreM;
  String? nombreP;

  FamiliaresPacientesCancelaradministracionmedicamentoResponse({
    required this.message,
    required this.fechaSiguienteDosis,
    required this.nombreM,
    required this.nombreP,
  });

  factory FamiliaresPacientesCancelaradministracionmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesCancelaradministracionmedicamentoResponse(
      message: json['message'],
      fechaSiguienteDosis: json['FechaSiguienteDosis'],
      nombreM: json['NombreM'],
      nombreP: json['NombreP'],
    );
  }
}
