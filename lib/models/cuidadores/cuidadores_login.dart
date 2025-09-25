class CuidadoresLogin {
  String contrasena;
  String credencial;

  CuidadoresLogin({required this.contrasena, required this.credencial});

  Map<String, dynamic> toJson() {
    return {'Contrasena': contrasena, 'Credencial': credencial};
  }

  factory CuidadoresLogin.fromJson(Map<String, dynamic> json) {
    return CuidadoresLogin(
      contrasena: json['Contrasena'],
      credencial: json['Credencial'],
    );
  }
}

class CuidadoresLoginResponse {
  String message;
  Usuario? usuario;
  CuidadoresLoginResponse({required this.message, required this.usuario});

  factory CuidadoresLoginResponse.fromJson(Map<String, dynamic> json) {
    return CuidadoresLoginResponse(
      message: json['message'],
      usuario: json['Usuario'] != null
          ? Usuario.fromJson(json['Usuario'])
          : null,
    );
  }
}

class Usuario {
  int idUsuario;
  String tokenAcceso;

  Usuario({required this.idUsuario, required this.tokenAcceso});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['IdUsuario'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}
