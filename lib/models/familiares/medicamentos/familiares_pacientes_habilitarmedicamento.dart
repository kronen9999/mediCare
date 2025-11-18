class FamiliaresPacientesHabilitarmedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;
  final String horaCalculo;

  FamiliaresPacientesHabilitarmedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.idMedicamento,
    required this.horaCalculo,
  });

  factory FamiliaresPacientesHabilitarmedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesHabilitarmedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      idMedicamento: json['IdMedicamento'],
      horaCalculo: json['HoraCalculo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'IdMedicamento': idMedicamento,
      'HoraCalculo': horaCalculo,
    };
  }
}

class FamiliaresPacientesHabilitarmedicamentoResponse {
  final String message;
  final String fechaSiguienteDosis;
  final int historialMedicamento;
  final String nombreM;
  final String nombreP;

  FamiliaresPacientesHabilitarmedicamentoResponse({
    required this.message,
    required this.fechaSiguienteDosis,
    required this.historialMedicamento,
    required this.nombreM,
    required this.nombreP,
  });

  factory FamiliaresPacientesHabilitarmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesHabilitarmedicamentoResponse(
      message: json['message'],
      fechaSiguienteDosis: json['FechaSiguienteDosis'],
      historialMedicamento: json['historialMedicamento'],
      nombreM: json['NombreM'],
      nombreP: json['NombreP'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'FechaSiguienteDosis': fechaSiguienteDosis,
      'historialMedicamento': historialMedicamento,
      'NombreM': nombreM,
      'NombreP': nombreP,
    };
  }
}
