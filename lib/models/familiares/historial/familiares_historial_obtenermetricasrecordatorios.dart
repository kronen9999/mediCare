class FamiliaresHistorialObtenerMetricasRecordatorios {
  final String idFamiliar;
  final String tokenAcceso;

  FamiliaresHistorialObtenerMetricasRecordatorios({
    required this.idFamiliar,
    required this.tokenAcceso,
  });

  Map<String, dynamic> toJson() {
    return {'IdFamiliar': idFamiliar, 'TokenAcceso': tokenAcceso};
  }

  factory FamiliaresHistorialObtenerMetricasRecordatorios.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresHistorialObtenerMetricasRecordatorios(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class FamiliaresHistorialObtenerMetricasRecordatoriosResponse {
  final int recordatoriosCancelados;
  final int recordatoriosAdministrados;

  FamiliaresHistorialObtenerMetricasRecordatoriosResponse({
    required this.recordatoriosCancelados,
    required this.recordatoriosAdministrados,
  });

  factory FamiliaresHistorialObtenerMetricasRecordatoriosResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresHistorialObtenerMetricasRecordatoriosResponse(
      recordatoriosCancelados: json['RecordatoriosCancelados'],
      recordatoriosAdministrados: json['RecordatoriosAdministrados'],
    );
  }
}
