class CuidadorObtenerHistorialRecordatorios {
  final String idCuidador;
  final String tokenAcceso;
  final String fechaDatos;

  CuidadorObtenerHistorialRecordatorios({
    required this.idCuidador,
    required this.tokenAcceso,
    required this.fechaDatos,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdCuidador': idCuidador,
      'TokenAcceso': tokenAcceso,
      'FechaDatos': fechaDatos,
    };
  }

  factory CuidadorObtenerHistorialRecordatorios.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadorObtenerHistorialRecordatorios(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
      fechaDatos: json['FechaDatos'],
    );
  }
}

class CuidadorObtenerHistorialRecordatoriosResponse {
  final List<Recordatorios> recordatorios;

  CuidadorObtenerHistorialRecordatoriosResponse({required this.recordatorios});

  CuidadorObtenerHistorialRecordatoriosResponse.fromJson(
    Map<String, dynamic> json,
  ) : recordatorios = (json['Recordatorios'] as List? ?? [])
          .map((e) => Recordatorios.fromJson(e))
          .toList();
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
