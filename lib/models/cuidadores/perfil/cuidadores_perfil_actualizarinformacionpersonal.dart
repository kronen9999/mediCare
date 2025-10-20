class CuidadoresPerfilActualizarinformacionpersonal {
  final String idCuidador;
  final String tokenAcceso;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String direccion;
  final String telefono1;
  final String telefono2;

  CuidadoresPerfilActualizarinformacionpersonal({
    required this.idCuidador,
    required this.tokenAcceso,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.direccion,
    required this.telefono1,
    required this.telefono2,
  });

  factory CuidadoresPerfilActualizarinformacionpersonal.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilActualizarinformacionpersonal(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
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
      'IdCuidador': idCuidador,
      'TokenAcceso': tokenAcceso,
      'Nombre': nombre,
      'ApellidoP': apellidoP,
      'ApellidoM': apellidoM,
      'Direccion': direccion,
      'Telefono1': telefono1,
      'Telefono2': telefono2,
    };
  }
}

class CuidadoresPerfilActualizarinformacionpersonalResponse {
  final String message;

  CuidadoresPerfilActualizarinformacionpersonalResponse({
    required this.message,
  });

  factory CuidadoresPerfilActualizarinformacionpersonalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresPerfilActualizarinformacionpersonalResponse(
      message: json['message'],
    );
  }
}
