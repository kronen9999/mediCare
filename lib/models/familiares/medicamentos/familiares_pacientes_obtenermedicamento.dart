class FamiliaresPacientesObtenermedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;

  FamiliaresPacientesObtenermedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.idMedicamento,
  });

  factory FamiliaresPacientesObtenermedicamento.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenermedicamento(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      idMedicamento: json['IdMedicamento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'IdMedicamento': idMedicamento,
    };
  }
}

class FamiliaresPacientesObtenermedicamentoResponse {
  final int idMedicamento;
  final String nombreM;
  final String? descripcionM;
  final String tipoMedicamento;
  final int intervaloHoras;
  final int intervaloMinutos;
  final int dosis;
  final String unidadDosis;
  final String? notas;

  FamiliaresPacientesObtenermedicamentoResponse({
    required this.idMedicamento,
    required this.nombreM,
    required this.descripcionM,
    required this.tipoMedicamento,
    required this.intervaloHoras,
    required this.intervaloMinutos,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
  });

  factory FamiliaresPacientesObtenermedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenermedicamentoResponse(
      idMedicamento: json['IdMedicamento'],
      nombreM: json['NombreM'],
      descripcionM: json['DescripcionM'],
      tipoMedicamento: json['TipoMedicamento'],
      intervaloHoras: json['IntervaloHoras'],
      intervaloMinutos: json['IntervaloMinutos'],
      dosis: json['Dosis'],
      unidadDosis: json['UnidadDosis'],
      notas: json['Notas'],
    );
  }
}
