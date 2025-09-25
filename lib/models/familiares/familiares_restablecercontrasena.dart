class FamiliaresRestablecercontrasena {
  String correoE;
  String codigoVerificacion;
  String nuevaContrasena;

  FamiliaresRestablecercontrasena({
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

  factory FamiliaresRestablecercontrasena.fromJson(Map<String, dynamic> json) {
    return FamiliaresRestablecercontrasena(
      correoE: json['CorreoE'],
      codigoVerificacion: json['CodigoVerificacion'],
      nuevaContrasena: json['NuevaContrasena'],
    );
  }
}

class FamiliaresRestablecercontrasenaResponse {
  String message;

  FamiliaresRestablecercontrasenaResponse({required this.message});

  factory FamiliaresRestablecercontrasenaResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresRestablecercontrasenaResponse(message: json['message']);
  }
}
