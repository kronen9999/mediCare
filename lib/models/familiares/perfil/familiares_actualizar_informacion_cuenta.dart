class FamiliaresActualizarInformacionCuenta {
  String idFamiliar;
  String tokenAcceso;
  String correoE;
  String usuario;

  FamiliaresActualizarInformacionCuenta({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.correoE,
    required this.usuario,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'CorreoE': correoE,
      'Usuario': usuario,
    };
  }

  factory FamiliaresActualizarInformacionCuenta.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresActualizarInformacionCuenta(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      correoE: json['CorreoE'],
      usuario: json['Usuario'],
    );
  }
}

class FamiliaresActualizarInformacionCuentaResponse {
  String message;

  FamiliaresActualizarInformacionCuentaResponse({required this.message});

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory FamiliaresActualizarInformacionCuentaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresActualizarInformacionCuentaResponse(
      message: json['message'],
    );
  }
}
