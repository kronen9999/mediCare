class FamiliaresPacientesAdministrarmedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idHistorial;
  final String fechaAdministracion;

  FamiliaresPacientesAdministrarmedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idHistorial,
    required this.fechaAdministracion,
  });

  factory FamiliaresPacientesAdministrarmedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesAdministrarmedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idHistorial: json['IdHistorial'].toString(),
      fechaAdministracion: json['FechaAdministracion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdHistorial': idHistorial,
      'FechaAdministracion': fechaAdministracion,
    };
  }
}

class FamiliaresPacientesAdministrarmedicamentoResponse {
  final String message;
  final String? fechaSiguienteDosis;

  FamiliaresPacientesAdministrarmedicamentoResponse({
    required this.message,
    this.fechaSiguienteDosis,
  });

  factory FamiliaresPacientesAdministrarmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesAdministrarmedicamentoResponse(
      message: json['message'],
      fechaSiguienteDosis: json['FechaSiguienteDosis'],
    );
  }
}
