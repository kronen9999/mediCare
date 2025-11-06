class FamiliaresHistorialRecordatorios {
  final String idFamiliar;
  final String tokenAcceso;
  final String fechaDatos;

  FamiliaresHistorialRecordatorios({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.fechaDatos,
  });

  factory FamiliaresHistorialRecordatorios.fromJson(Map<String, dynamic> json) {
    return FamiliaresHistorialRecordatorios(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      fechaDatos: json['FechaDatos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'FechaDatos': fechaDatos,
    };
  }
}

class Recordatorios {
  final int idHistorial;
  final String fechaProgramada;
  final String? horaAdministracion;
  final String nombreM;
  final String nombreP;
  final String dosis;
  final String unidadDosis;
  final String? notas;
  final String? administro;
  final String estado;
  final String? nombreCuidador;

  Recordatorios({
    required this.idHistorial,
    required this.fechaProgramada,
    required this.horaAdministracion,
    required this.nombreM,
    required this.nombreP,
    required this.dosis,
    required this.unidadDosis,
    required this.notas,
    required this.administro,
    required this.estado,
    required this.nombreCuidador,
  });

  factory Recordatorios.fromJson(Map<String, dynamic> json) {
    return Recordatorios(
      idHistorial: json['IdHistorial'],
      fechaProgramada: json['FechaProgramada'],
      horaAdministracion: json['HoraAdministracion'],
      nombreM: json['NombreM'],
      nombreP: json['NombreP'],
      dosis: json['Dosis'],
      unidadDosis: json['UnidadDosis'],
      notas: json['Notas'],
      administro: json['Administro'],
      estado: json['Estado'],
      nombreCuidador: json['NombreCuidador'],
    );
  }
}

class FamiliaresHistorialRecordatoriosResponse {
  final List<Recordatorios> recordatorios;

  FamiliaresHistorialRecordatoriosResponse({required this.recordatorios});

  factory FamiliaresHistorialRecordatoriosResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    var list = json['Recordatorios'] as List;
    List<Recordatorios> recordatoriosList = list
        .map((i) => Recordatorios.fromJson(i))
        .toList();

    return FamiliaresHistorialRecordatoriosResponse(
      recordatorios: recordatoriosList,
    );
  }
}
