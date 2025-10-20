class CuidadoresPerfilActualizarcontrasena {
  final String idCuidador;
  final String tokenAcceso;
  final String contrasenaActual;
  final String nuevaContrasena;

  CuidadoresPerfilActualizarcontrasena({
    required this.idCuidador,
    required this.tokenAcceso,
    required this.contrasenaActual,
    required this.nuevaContrasena,
  });

  factory CuidadoresPerfilActualizarcontrasena.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilActualizarcontrasena(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
      contrasenaActual: json['ContrasenaActual'],
      nuevaContrasena: json['NuevaContrasena'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdCuidador': idCuidador,
      'TokenAcceso': tokenAcceso,
      'ContrasenaActual': contrasenaActual,
      'NuevaContrasena': nuevaContrasena,
    };
  }
}

class CuidadoresPerfilActualizarcontrasenaResponse {
  final String message;

  CuidadoresPerfilActualizarcontrasenaResponse({required this.message});

  factory CuidadoresPerfilActualizarcontrasenaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilActualizarcontrasenaResponse(
      message: json['message'],
    );
  }
}
