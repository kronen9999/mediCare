class FamiliaresCuidadoresCambiarContrasena {
  final String? idFamiliar;
  final String? tokenAcceso;
  final String? idCuidador;
  final String? nuevaContrasena;

  FamiliaresCuidadoresCambiarContrasena({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idCuidador,
    required this.nuevaContrasena,
  });

  factory FamiliaresCuidadoresCambiarContrasena.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresCambiarContrasena(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idCuidador: json['IdCuidador'],
      nuevaContrasena: json['NuevaContrasena'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdCuidador': idCuidador,
      'NuevaContrasena': nuevaContrasena,
    };
  }
}

class FamiliaresCuidadoresCambiarContrasenaResponse {
  String? message;

  FamiliaresCuidadoresCambiarContrasenaResponse({required this.message});

  factory FamiliaresCuidadoresCambiarContrasenaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresCambiarContrasenaResponse(
      message: json['message'],
    );
  }
}
