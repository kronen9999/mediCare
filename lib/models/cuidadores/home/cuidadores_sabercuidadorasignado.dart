class CuidadoresSabercuidadorasignado {
  final String idCuidador;
  final String tokenAcceso;

  CuidadoresSabercuidadorasignado({
    required this.idCuidador,
    required this.tokenAcceso,
  });

  factory CuidadoresSabercuidadorasignado.fromJson(Map<String, dynamic> json) {
    return CuidadoresSabercuidadorasignado(
      idCuidador: json['IdCuidador'],
      tokenAcceso: json['TokenAcceso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdCuidador': idCuidador, 'TokenAcceso': tokenAcceso};
  }
}

class CuidadoresSabercuidadorasignadoResponse {
  final String message;
  final String? nombre;
  final String? apellidoP;
  final String? apellidoM;
  final String? padecimiento;
  final String? direccion;
  final String? telefono1;
  final String? telefono2;

  CuidadoresSabercuidadorasignadoResponse({
    required this.message,
    this.nombre,
    this.apellidoP,
    this.apellidoM,
    this.padecimiento,
    this.direccion,
    this.telefono1,
    this.telefono2,
  });

  factory CuidadoresSabercuidadorasignadoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresSabercuidadorasignadoResponse(
      message: json['message'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      padecimiento: json['Padecimiento'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
    );
  }
}
