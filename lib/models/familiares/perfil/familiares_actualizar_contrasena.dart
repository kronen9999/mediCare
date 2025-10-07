class FamiliaresActualizarContrasena {
  String idFamiliar;
  String tokenAcceso;
  String contrasenaActual;
  String nuevaContrasena;

  FamiliaresActualizarContrasena({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.contrasenaActual,
    required this.nuevaContrasena,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'ContrasenaActual': contrasenaActual,
      'NuevaContrasena': nuevaContrasena,
    };
  }

  factory FamiliaresActualizarContrasena.fromJson(Map<String, dynamic> json) {
    return FamiliaresActualizarContrasena(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      contrasenaActual: json['ContrasenaActual'],
      nuevaContrasena: json['NuevaContrasena'],
    );
  }
}

class FamiliaresActualizarContrasenaResponse {
  String message;

  FamiliaresActualizarContrasenaResponse({required this.message});

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory FamiliaresActualizarContrasenaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresActualizarContrasenaResponse(message: json['message']);
  }
}
