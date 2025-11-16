class CuidadoresObtenerproximosrecordatorios {
  final String idCuidador;
  final String tokenAcceso;

  CuidadoresObtenerproximosrecordatorios({
    required this.idCuidador,
    required this.tokenAcceso,
  });

  Map<String, dynamic> toJson() {
    return {'IdCuidador': idCuidador, 'TokenAcceso': tokenAcceso};
  }

  factory CuidadoresObtenerproximosrecordatorios.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresObtenerproximosrecordatorios(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class CuidadoresObtenerproximosrecordatoriosResponse {
  final List<Recordatorios> recordatorios;

  CuidadoresObtenerproximosrecordatoriosResponse({required this.recordatorios});

  factory CuidadoresObtenerproximosrecordatoriosResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    var list = json['recordatorios'] as List? ?? [];
    List<Recordatorios> recordatoriosList = list
        .map((i) => Recordatorios.fromJson(i))
        .toList();

    return CuidadoresObtenerproximosrecordatoriosResponse(
      recordatorios: recordatoriosList,
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

  Recordatorios({
    required this.idHistorial,
    required this.fechaProgramada,
    required this.nombreM,
    required this.nombreP,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
  });

  factory Recordatorios.fromJson(Map<String, dynamic> json) {
    return Recordatorios(
      idHistorial: json['idHistorial'],
      fechaProgramada: json['FechaProgramada'],
      nombreM: json['NombreM'],
      nombreP: json['NombreP'],
      dosis: json['Dosis'],
      unidadDosis: json['UnidadDosis'],
      notas: json['Notas'],
    );
  }
}
