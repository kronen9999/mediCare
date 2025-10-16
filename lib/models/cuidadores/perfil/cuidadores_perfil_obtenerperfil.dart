class CuidadoresPerfilObtenerperfil {
  final String idCuidador;
  final String tokenAcceso;

  CuidadoresPerfilObtenerperfil({
    required this.idCuidador,
    required this.tokenAcceso,
  });

  factory CuidadoresPerfilObtenerperfil.fromJson(Map<String, dynamic> json) {
    return CuidadoresPerfilObtenerperfil(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdCuidador': idCuidador, 'TokenAcceso': tokenAcceso};
  }
}

class CuidadoresPerfilObtenerperfilResponse {
  final int? idCuidador;
  final String? nombre;
  final String? apellidoPaterno;
  final String? apellidoMaterno;
  final String? usuario;
  final String? correoE;
  final String? telefono1;
  final String? telefono2;
  final String? direccion;
  final String? nombreFamiliar;
  final String? apellidoPFamiliar;
  final String? apellidoMFamiliar;
  final String? correoEFamiliar;
  final String? direccionFamiliar;
  final String? telefono1Familiar;
  final String? telefono2Familiar;

  CuidadoresPerfilObtenerperfilResponse({
    required this.idCuidador,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.usuario,
    required this.correoE,
    required this.telefono1,
    required this.telefono2,
    required this.direccion,
    required this.nombreFamiliar,
    required this.apellidoPFamiliar,
    required this.apellidoMFamiliar,
    required this.correoEFamiliar,
    required this.direccionFamiliar,
    required this.telefono1Familiar,
    required this.telefono2Familiar,
  });

  factory CuidadoresPerfilObtenerperfilResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilObtenerperfilResponse(
      idCuidador: json['IdCuidador'],
      nombre: json['Nombre'],
      apellidoPaterno: json['ApellidoPaterno'],
      apellidoMaterno: json['ApellidoMaterno'],
      usuario: json['Usuario'],
      correoE: json['CorreoE'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
      direccion: json['Direccion'],
      nombreFamiliar: json['NombreFamiliar'],
      apellidoPFamiliar: json['ApellidoPFamiliar'],
      apellidoMFamiliar: json['ApellidoMFamiliar'],
      correoEFamiliar: json['CorreoEFamiliar'],
      direccionFamiliar: json['DireccionFamiliar'],
      telefono1Familiar: json['Telefono1Familiar'],
      telefono2Familiar: json['Telefono2Familiar'],
    );
  }
}
