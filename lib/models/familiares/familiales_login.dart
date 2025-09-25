class FamilialesLogin {
  String credencial;
  String contrasena;

  FamilialesLogin({required this.credencial, required this.contrasena});

  Map<String, dynamic> toJson() {
    return {'Credencial': credencial, 'Contrasena': contrasena};
  }

  factory FamilialesLogin.fromJson(Map<String, dynamic> json) {
    return FamilialesLogin(
      credencial: json['Credencial'],
      contrasena: json['Contrasena'],
    );
  }
}

class Usuario {
  final int idUsuario;
  final String tokenAcceso;

  Usuario({required this.idUsuario, required this.tokenAcceso});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['IdUsuario'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class FamiliaresLoginResponse {
  final String message;
  final Usuario? usuario;

  FamiliaresLoginResponse({required this.message, this.usuario});

  factory FamiliaresLoginResponse.fromJson(Map<String, dynamic> json) {
    return FamiliaresLoginResponse(
      message: json['message'],
      usuario: json['Usuario'] != null
          ? Usuario.fromJson(json['Usuario'])
          : null,
    );
  }
}
