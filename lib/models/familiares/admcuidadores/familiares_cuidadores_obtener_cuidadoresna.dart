class FamiliaresCuidadoresObtenerCuidadoresna {
  final String idFamiliar;
  final String tokenAcceso;

  FamiliaresCuidadoresObtenerCuidadoresna({
    required this.idFamiliar,
    required this.tokenAcceso,
  });

  factory FamiliaresCuidadoresObtenerCuidadoresna.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresObtenerCuidadoresna(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdFamiliar': idFamiliar, 'TokenAcceso': tokenAcceso};
  }
}

class FamiliaresCuidadoresObtenerCuidadoresnaResponse {
  List<Cuidadoresna> cuidadoresNoAsignados;

  FamiliaresCuidadoresObtenerCuidadoresnaResponse({
    required this.cuidadoresNoAsignados,
  });

  factory FamiliaresCuidadoresObtenerCuidadoresnaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    var list = json['CuidadoresNoAsignados'] as List;
    List<Cuidadoresna> cuidadoresList = list
        .map((i) => Cuidadoresna.fromJson(i))
        .toList();

    return FamiliaresCuidadoresObtenerCuidadoresnaResponse(
      cuidadoresNoAsignados: cuidadoresList,
    );
  }
}

class Cuidadoresna {
  final int? idCuidador;
  final String? nombre;
  final String? apellidoM;
  final String? apellidoP;

  Cuidadoresna({
    required this.idCuidador,
    required this.nombre,
    required this.apellidoM,
    required this.apellidoP,
  });

  factory Cuidadoresna.fromJson(Map<String, dynamic> json) {
    return Cuidadoresna(
      idCuidador: json['IdCuidador'],
      nombre: json['Nombre'],
      apellidoM: json['ApellidoM'],
      apellidoP: json['ApellidoP'],
    );
  }
}
