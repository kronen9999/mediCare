class CuidadoresPerfilActualizarinformacioncuenta {
  final String idCuidador;
  final String tokenAcceso;
  final String usuario;
  final String correoE;

  CuidadoresPerfilActualizarinformacioncuenta({
    required this.idCuidador,
    required this.tokenAcceso,
    required this.usuario,
    required this.correoE,
  });

  factory CuidadoresPerfilActualizarinformacioncuenta.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilActualizarinformacioncuenta(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
      usuario: json['Usuario'],
      correoE: json['CorreoE'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdCuidador': idCuidador,
      'TokenAcceso': tokenAcceso,
      'Usuario': usuario,
      'CorreoE': correoE,
    };
  }
}

class CuidadoresPerfilActualizarinformacioncuentaResponse {
  final String message;

  CuidadoresPerfilActualizarinformacioncuentaResponse({required this.message});

  factory CuidadoresPerfilActualizarinformacioncuentaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilActualizarinformacioncuentaResponse(
      message: json['message'],
    );
  }
}
