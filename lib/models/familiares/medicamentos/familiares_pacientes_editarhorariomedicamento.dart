class FamiliaresPacientesEditarhorariomedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;
  final String intervaloHoras;
  final String intervaloMinutos;
  final String dosis;

  FamiliaresPacientesEditarhorariomedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.idMedicamento,
    required this.intervaloHoras,
    required this.intervaloMinutos,
    required this.dosis,
  });

  factory FamiliaresPacientesEditarhorariomedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesEditarhorariomedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      idMedicamento: json['IdMedicamento'],
      intervaloHoras: json['IntervaloHoras'],
      intervaloMinutos: json['IntervaloMinutos'],
      dosis: json['Dosis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'IdMedicamento': idMedicamento,
      'IntervaloHoras': intervaloHoras,
      'IntervaloMinutos': intervaloMinutos,
      'Dosis': dosis,
    };
  }
}

class FamiliaresPacientesEditarhorariomedicamentoResponse {
  String message;

  FamiliaresPacientesEditarhorariomedicamentoResponse({required this.message});

  factory FamiliaresPacientesEditarhorariomedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesEditarhorariomedicamentoResponse(
      message: json["message"],
    );
  }
}
