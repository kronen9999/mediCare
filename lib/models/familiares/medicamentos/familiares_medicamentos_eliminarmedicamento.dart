class FamiliaresMedicamentosEliminarmedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;

  FamiliaresMedicamentosEliminarmedicamento({
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

  factory FamiliaresMedicamentosEliminarmedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresMedicamentosEliminarmedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      idMedicamento: json['IdMedicamento'],
    );
  }
}

class FamiliaresMedicamentosEliminarmedicamentoResponse {
  final String message;

  FamiliaresMedicamentosEliminarmedicamentoResponse({required this.message});

  factory FamiliaresMedicamentosEliminarmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresMedicamentosEliminarmedicamentoResponse(
      message: json['message'],
    );
  }
}
