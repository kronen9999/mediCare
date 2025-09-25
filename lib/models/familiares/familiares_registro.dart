class FamiliaresRegistro {
  String correoE;
  String contrasena;

  FamiliaresRegistro({required this.correoE, required this.contrasena});

  Map<String, dynamic> toJson() => {
    'CorreoE': correoE,
    'Contrasena': contrasena,
  };

  factory FamiliaresRegistro.fromJson(Map<String, dynamic> json) {
    return FamiliaresRegistro(
      correoE: json['CorreoE'],
      contrasena: json['Contrasena'],
    );
  }
}

class FamiliaresRegistroResponse {
  String? message;

  FamiliaresRegistroResponse({this.message});

  factory FamiliaresRegistroResponse.fromJson(Map<String, dynamic> json) {
    return FamiliaresRegistroResponse(message: json['message']);
  }
}
