class FamiliaresCuidadoresAgregarCuidador {
  final String idFamiliar;
  final String tokenAcceso;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String direccion;
  final String telefono1;
  final String telefono2;
  final String correoE;
  final String usuario;
  final String contrasena;

  FamiliaresCuidadoresAgregarCuidador({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.direccion,
    required this.telefono1,
    required this.telefono2,
    required this.correoE,
    required this.usuario,
    required this.contrasena,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'Nombre': nombre,
      'ApellidoP': apellidoP,
      'ApellidoM': apellidoM,
      'Direccion': direccion,
      'Telefono1': telefono1,
      'Telefono2': telefono2,
      'CorreoE': correoE,
      'Usuario': usuario,
      'Contrasena': contrasena,
    };
  }

  factory FamiliaresCuidadoresAgregarCuidador.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresAgregarCuidador(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
      correoE: json['CorreoE'],
      usuario: json['Usuario'],
      contrasena: json['Contrasena'],
    );
  }
}

class FamiliaresCuidadoresAgregarCuidadorResponse {
  String message;

  FamiliaresCuidadoresAgregarCuidadorResponse({required this.message});

  factory FamiliaresCuidadoresAgregarCuidadorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresAgregarCuidadorResponse(
      message: json['message'],
    );
  }
}
