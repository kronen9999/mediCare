class FamiliaresCuidadoresEliminarCuidador {
  final String? idFamiliar;
  final String? tokenAcceso;
  final String? idCuidador;

  FamiliaresCuidadoresEliminarCuidador({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idCuidador,
  });

  factory FamiliaresCuidadoresEliminarCuidador.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresEliminarCuidador(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idCuidador: json['IdCuidador'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdCuidador': idCuidador,
    };
  }
}

class FamiliaresCuidadoresEliminarCuidadorResponse {
  String? message;

  FamiliaresCuidadoresEliminarCuidadorResponse({this.message});

  factory FamiliaresCuidadoresEliminarCuidadorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresEliminarCuidadorResponse(
      message: json['message'],
    );
  }
}
