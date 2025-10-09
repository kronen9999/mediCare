class FamiliaresCuidadoresEditarInformacionPerfil {
  final String idFamiliar;
  final String tokenAcceso;
  final String idCuidador;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String direccion;
  final String telefono1;
  final String telefono2;

  FamiliaresCuidadoresEditarInformacionPerfil({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idCuidador,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.direccion,
    required this.telefono1,
    required this.telefono2,
  });

  factory FamiliaresCuidadoresEditarInformacionPerfil.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresEditarInformacionPerfil(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idCuidador: json['IdCuidador'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdCuidador': idCuidador,
      'Nombre': nombre,
      'ApellidoP': apellidoP,
      'ApellidoM': apellidoM,
      'Direccion': direccion,
      'Telefono1': telefono1,
      'Telefono2': telefono2,
    };
  }
}

class FamiliaresCuidadoresEditarInformacionPerfilResponse {
  String? message;

  FamiliaresCuidadoresEditarInformacionPerfilResponse({required this.message});

  factory FamiliaresCuidadoresEditarInformacionPerfilResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresEditarInformacionPerfilResponse(
      message: json['message'],
    );
  }
}
