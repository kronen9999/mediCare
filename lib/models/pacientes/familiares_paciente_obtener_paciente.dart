class FamiliaresPacienteObtenerPaciente {
  final String? idFamiliar;
  final String tokenAcceso;
  final String? idPaciente;

  FamiliaresPacienteObtenerPaciente({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
  });

  factory FamiliaresPacienteObtenerPaciente.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacienteObtenerPaciente(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
    };
  }
}

class FamiliaresPacienteObtenerPacienteResponse {
  final int? idPaciente;
  final String? nombre;
  final String? apellidoP;
  final String? apellidoM;
  final String? direccion;
  final String? telefono1;
  final String? telefono2;
  final String? padecimiento;

  FamiliaresPacienteObtenerPacienteResponse({
    this.idPaciente,
    this.nombre,
    this.apellidoP,
    this.apellidoM,
    this.direccion,
    this.telefono1,
    this.telefono2,
    this.padecimiento,
  });

  factory FamiliaresPacienteObtenerPacienteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacienteObtenerPacienteResponse(
      idPaciente: json['IdPaciente'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
      padecimiento: json["Padecimiento"],
    );
  }
}
