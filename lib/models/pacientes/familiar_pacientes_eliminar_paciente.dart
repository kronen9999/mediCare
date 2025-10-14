class FamiliarPacientesEliminarPaciente {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;

  FamiliarPacientesEliminarPaciente({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
  });

  factory FamiliarPacientesEliminarPaciente.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliarPacientesEliminarPaciente(
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

class FamiliarPacientesEliminarPacienteResponse {
  final String message;

  FamiliarPacientesEliminarPacienteResponse({required this.message});

  factory FamiliarPacientesEliminarPacienteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliarPacientesEliminarPacienteResponse(message: json['message']);
  }
}
