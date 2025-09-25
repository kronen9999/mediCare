class CuidadoresRestablecercontrasena {
  String correoE;
  String codigoVerificacion;
  String nuevaContrasena;

  CuidadoresRestablecercontrasena({
    required this.correoE,
    required this.codigoVerificacion,
    required this.nuevaContrasena,
  });

  Map<String, dynamic> toJson() {
    return {
      'CorreoE': correoE,
      'CodigoVerificacion': codigoVerificacion,
      'NuevaContrasena': nuevaContrasena,
    };
  }

  factory CuidadoresRestablecercontrasena.fromJson(Map<String, dynamic> json) {
    return CuidadoresRestablecercontrasena(
      correoE: json['CorreoE'],
      codigoVerificacion: json['CodigoVerificacion'],
      nuevaContrasena: json['NuevaContrasena'],
    );
  }
}

class CuidadoresRestablecercontrasenaResponse {
  String message;

  CuidadoresRestablecercontrasenaResponse({required this.message});

  factory CuidadoresRestablecercontrasenaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresRestablecercontrasenaResponse(message: json['message']);
  }
}
