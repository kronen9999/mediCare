class FamiliaresPacientesDesabilitarmedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;

  FamiliaresPacientesDesabilitarmedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.idMedicamento,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'IdMedicamento': idMedicamento,
    };
  }

  factory FamiliaresPacientesDesabilitarmedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesDesabilitarmedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      idMedicamento: json['IdMedicamento'],
    );
  }
}

class FamiliaresPacientesDesabilitarmedicamentoResponse {
  String message;
  FamiliaresPacientesDesabilitarmedicamentoResponse({required this.message});

  factory FamiliaresPacientesDesabilitarmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesDesabilitarmedicamentoResponse(
      message: json['message'],
    );
  }
}
