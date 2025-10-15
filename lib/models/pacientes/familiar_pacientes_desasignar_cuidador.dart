class FamiliarPacientesDesasignarCuidador {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;

  FamiliarPacientesDesasignarCuidador({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
  });

  factory FamiliarPacientesDesasignarCuidador.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliarPacientesDesasignarCuidador(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
    };
  }
}

class FamiliarPacientesDesasignarCuidadorResponse {
  final String message;

  FamiliarPacientesDesasignarCuidadorResponse({required this.message});

  factory FamiliarPacientesDesasignarCuidadorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliarPacientesDesasignarCuidadorResponse(
      message: json['message'],
    );
  }
}
