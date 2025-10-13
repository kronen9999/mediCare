class FamiliaresPacientesObtenerPacientes {
  String? idFamiliar;
  String? tokenAcceso;

  FamiliaresPacientesObtenerPacientes({this.idFamiliar, this.tokenAcceso});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdFamiliar'] = idFamiliar;
    data['TokenAcceso'] = tokenAcceso;
    return data;
  }

  factory FamiliaresPacientesObtenerPacientes.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenerPacientes(
      idFamiliar: json["IdFamiliar"],
      tokenAcceso: json["TokenAcceso"],
    );
  }
}

class FamiliaresPacientesObtenerPacientesResponse {
  List<Pacientes>? pacientes;

  FamiliaresPacientesObtenerPacientesResponse({this.pacientes});

  factory FamiliaresPacientesObtenerPacientesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenerPacientesResponse(
      pacientes: (json['Pacientes'] as List<dynamic>?)
          ?.map((e) => Pacientes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Pacientes {
  int? idPaciente;
  String? nombre;
  String? apellidoP;
  String? apellidoM;
  String? padecimiento;
  String? direccion;
  String? telefono1;
  String? telefono2;
  int? idCuidador;
  String? nombreCuidador;
  String? apellidoPCuidador;
  String? apellidoMCuidador;

  Pacientes({
    this.idPaciente,
    this.nombre,
    this.apellidoP,
    this.apellidoM,
    this.padecimiento,
    this.direccion,
    this.telefono1,
    this.telefono2,
    this.idCuidador,
    this.nombreCuidador,
    this.apellidoPCuidador,
    this.apellidoMCuidador,
  });

  factory Pacientes.fromJson(Map<String, dynamic> json) {
    return Pacientes(
      idPaciente: json['IdPaciente'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      padecimiento: json['Padecimiento'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
      idCuidador: json['IdCuidador'],
      nombreCuidador: json['NombreCuidador'],
      apellidoPCuidador: json['ApellidoPCuidador'],
      apellidoMCuidador: json['ApellidoMCuidador'],
    );
  }
}
