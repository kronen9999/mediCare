class CuidadoresPerfilObtenerperfilbasico {
  String idCuidador;
  String tokenAcceso;

  CuidadoresPerfilObtenerperfilbasico({
    required this.idCuidador,
    required this.tokenAcceso,
  });

  Map<String, dynamic> toJson() {
    return {'IdCuidador': idCuidador, 'TokenAcceso': tokenAcceso};
  }

  factory CuidadoresPerfilObtenerperfilbasico.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilObtenerperfilbasico(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class CuidadoresPerfilObtenerperfilbasicoResponse {
  final int? idCuidador;
  final String? nombre;
  final String? apellidoPaterno;
  final String? apellidoMaterno;
  final String? usuario;
  final String? correoE;
  final String? telefono1;
  final String? telefono2;
  final String? direccion;

  CuidadoresPerfilObtenerperfilbasicoResponse({
    required this.idCuidador,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.usuario,
    required this.correoE,
    required this.telefono1,
    required this.telefono2,
    required this.direccion,
  });

  factory CuidadoresPerfilObtenerperfilbasicoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilObtenerperfilbasicoResponse(
      idCuidador: json['IdCuidador'],
      nombre: json['Nombre'],
      apellidoPaterno: json['ApellidoPaterno'],
      apellidoMaterno: json['ApellidoMaterno'],
      usuario: json['Usuario'],
      correoE: json['CorreoE'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
      direccion: json['Direccion'],
    );
  }
}
