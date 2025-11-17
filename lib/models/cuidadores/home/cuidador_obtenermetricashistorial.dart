class CuidadorObtenerMetricasHistorial {
  final String idCuidador;
  final String tokenAcceso;

  CuidadorObtenerMetricasHistorial({
    required this.idCuidador,
    required this.tokenAcceso,
  });

  factory CuidadorObtenerMetricasHistorial.fromJson(Map<String, dynamic> json) {
    return CuidadorObtenerMetricasHistorial(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdCuidador': idCuidador, 'TokenAcceso': tokenAcceso};
  }
}

class CuidadorObtenerMetricasHistorialResponse {
  final int recordatoriosCancelados;
  final int recordatoriosAdministrados;

  CuidadorObtenerMetricasHistorialResponse({
    required this.recordatoriosCancelados,
    required this.recordatoriosAdministrados,
  });

  factory CuidadorObtenerMetricasHistorialResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadorObtenerMetricasHistorialResponse(
      recordatoriosCancelados: json['RecordatoriosCancelados'],
      recordatoriosAdministrados: json['RecordatoriosAdministrados'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RecordatoriosCancelados': recordatoriosCancelados,
      'RecordatoriosAdministrados': recordatoriosAdministrados,
    };
  }
}
