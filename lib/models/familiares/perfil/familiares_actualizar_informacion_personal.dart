class FamiliaresActualizarInformacionPersonal {
  String? idFamiliar;
  String? tokenAcceso;
  String? nombre;
  String? apellidoP;
  String? apellidoM;
  String? direccion;
  String? telefono1;
  String? telefono2;

  FamiliaresActualizarInformacionPersonal({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.direccion,
    required this.telefono1,
    required this.telefono2,
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
    };
  }

  factory FamiliaresActualizarInformacionPersonal.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresActualizarInformacionPersonal(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
    );
  }
}

class FamiliaresActualizarInformacionPersonalResponse {
  String? message;

  FamiliaresActualizarInformacionPersonalResponse({required this.message});

  factory FamiliaresActualizarInformacionPersonalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresActualizarInformacionPersonalResponse(
      message: json['message'],
    );
  }
}
