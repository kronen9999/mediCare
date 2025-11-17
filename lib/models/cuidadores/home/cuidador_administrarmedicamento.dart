class CuidadorAdministrarmedicamento {
  final String idCuidador;
  final String tokenAcceso;
  final String idHistorial;
  final String fechaAdministracion;

  CuidadorAdministrarmedicamento({
    required this.idCuidador,
    required this.tokenAcceso,
    required this.idHistorial,
    required this.fechaAdministracion,
  });

  factory CuidadorAdministrarmedicamento.fromJson(Map<String, dynamic> json) {
    return CuidadorAdministrarmedicamento(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
      idHistorial: json['IdHistorial'],
      fechaAdministracion: json['FechaAdministracion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdCuidador': idCuidador,
      'TokenAcceso': tokenAcceso,
      'IdHistorial': idHistorial,
      'FechaAdministracion': fechaAdministracion,
    };
  }
}

class CuidadorAdministrarmedicamentoResponse {
  final String message;
  final String? fechaSiguienteDosis;
  final String? nombreM;
  final String? nombreP;

  CuidadorAdministrarmedicamentoResponse({
    required this.message,
    required this.fechaSiguienteDosis,
    required this.nombreM,
    required this.nombreP,
  });

  factory CuidadorAdministrarmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadorAdministrarmedicamentoResponse(
      message: json['message'],
      fechaSiguienteDosis: json['FechaSiguienteDosis'],
      nombreM: json['NombreM'],
      nombreP: json['NombreP'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'FechaSiguienteDosis': fechaSiguienteDosis,
      'NombreM': nombreM,
      'NombreP': nombreP,
    };
  }
}
