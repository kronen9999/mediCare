class FamiliaresPacientesAgregarmedicamentosh {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String nombreM;
  final String descripcionM;
  final String tipoMedicamento;
  final String horaPrimeraDosis;
  final String intervaloHoras;
  final String intervaloMinutos;
  final String primerRecordatorio;
  final String dosis;
  final String unidadDosis;
  final String notas;

  FamiliaresPacientesAgregarmedicamentosh({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.nombreM,
    required this.descripcionM,
    required this.tipoMedicamento,
    required this.horaPrimeraDosis,
    required this.intervaloHoras,
    required this.intervaloMinutos,
    required this.primerRecordatorio,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
  });

  factory FamiliaresPacientesAgregarmedicamentosh.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesAgregarmedicamentosh(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      nombreM: json['NombreM'],
      descripcionM: json['DescripcionM'],
      tipoMedicamento: json['TipoMedicamento'],
      horaPrimeraDosis: json['HoraPrimeraDosis'],
      intervaloHoras: json['IntervaloHoras'],
      intervaloMinutos: json['IntervaloMinutos'],
      primerRecordatorio: json['PrimerRecordatorio'],
      dosis: json['Dosis'],
      unidadDosis: json['UnidadDosis'],
      notas: json['Notas'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'NombreM': nombreM,
      'DescripcionM': descripcionM,
      'TipoMedicamento': tipoMedicamento,
      'HoraPrimeraDosis': horaPrimeraDosis,
      'IntervaloHoras': intervaloHoras,
      'IntervaloMinutos': intervaloMinutos,
      'PrimerRecordatorio': primerRecordatorio,
      'Dosis': dosis,
      'UnidadDosis': unidadDosis,
      'Notas': notas,
    };
  }
}

class FamiliaresPacientesAgregarmedicamentoshResponse {
  final String message;
  final String fechaProgramada;

  FamiliaresPacientesAgregarmedicamentoshResponse({
    required this.message,
    required this.fechaProgramada,
  });

  factory FamiliaresPacientesAgregarmedicamentoshResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesAgregarmedicamentoshResponse(
      message: json['message'],
      fechaProgramada: json['FechaProgramada'],
    );
  }
}
