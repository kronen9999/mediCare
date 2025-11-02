class FamiliaresPacientesObtenerproximosrecordatorios {
  final String idFamiliar;
  final String tokenAcceso;

  FamiliaresPacientesObtenerproximosrecordatorios({
    required this.idFamiliar,
    required this.tokenAcceso,
  });

  factory FamiliaresPacientesObtenerproximosrecordatorios.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenerproximosrecordatorios(
      idFamiliar: json['IdFamiliar'] as String,
      tokenAcceso: json['TokenAcceso'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdFamiliar': idFamiliar, 'TokenAcceso': tokenAcceso};
  }
}

class FamiliaresPacientesObtenerproximosrecordatoriosResponse {
  List<Recordatorios> recordatorios;

  FamiliaresPacientesObtenerproximosrecordatoriosResponse({
    required this.recordatorios,
  });

  factory FamiliaresPacientesObtenerproximosrecordatoriosResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenerproximosrecordatoriosResponse(
      recordatorios: (json['Recordatorios'] as List)
          .map((e) => Recordatorios.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Recordatorios {
  final int idHistorial;
  final String fechaProgramada;
  final String nombreM;
  final String nombreP;
  final String dosis;
  final String unidadDosis;
  final String? notas;
  final String? nombreCuidador;

  Recordatorios({
    required this.idHistorial,
    required this.fechaProgramada,
    required this.nombreM,
    required this.nombreP,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
    required this.nombreCuidador,
  });

  factory Recordatorios.fromJson(Map<String, dynamic> json) {
    return Recordatorios(
      idHistorial: json['IdHistorial'] as int,
      fechaProgramada: json['FechaProgramada'] as String,
      nombreM: json['NombreM'] as String,
      nombreP: json['NombreP'] as String,
      dosis: json['Dosis'] as String,
      unidadDosis: json['UnidadDosis'] as String,
      notas: json['Notas'] as String,
      nombreCuidador: json['NombreCuidador'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdHistorial': idHistorial,
      'FechaProgramada': fechaProgramada,
      'NombreM': nombreM,
      'NombreP': nombreP,
      'Dosis': dosis,
      'UnidadDosis': unidadDosis,
      'Notas': notas,
      'NombreCuidador': nombreCuidador,
    };
  }
}
