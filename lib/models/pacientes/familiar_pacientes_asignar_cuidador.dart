class FamiliarPacientesAsignarCuidador {
  String idFamiliar;
  String tokenAcceso;
  String idPaciente;
  String idCuidador;

  FamiliarPacientesAsignarCuidador({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.idCuidador,
  });

  factory FamiliarPacientesAsignarCuidador.fromJson(Map<String, dynamic> json) {
    return FamiliarPacientesAsignarCuidador(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      idCuidador: json['IdCuidador'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'IdCuidador': idCuidador,
    };
  }
}

class FamiliarPacientesAsignarCuidadorResponse {
  String message;

  FamiliarPacientesAsignarCuidadorResponse({required this.message});

  factory FamiliarPacientesAsignarCuidadorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliarPacientesAsignarCuidadorResponse(message: json['message']);
  }
}
