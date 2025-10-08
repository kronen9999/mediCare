class FamiliaresCuidadoresObtenerCuidadores {
  String idFamiliar;
  String tokenAcceso;

  FamiliaresCuidadoresObtenerCuidadores({
    required this.idFamiliar,
    required this.tokenAcceso,
  });

  Map<String, dynamic> toJson() {
    return {'IdFamiliar': idFamiliar, 'TokenAcceso': tokenAcceso};
  }

  factory FamiliaresCuidadoresObtenerCuidadores.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresObtenerCuidadores(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class FamiliaresCuidadoresObtenerCuidadoresResponse {
  List<Cuidadores> cuidadores;
  FamiliaresCuidadoresObtenerCuidadoresResponse({required this.cuidadores});
  factory FamiliaresCuidadoresObtenerCuidadoresResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    var list = json['Cuidadores'] as List;
    List<Cuidadores> cuidadoresList = list
        .map((i) => Cuidadores.fromJson(i))
        .toList();
    return FamiliaresCuidadoresObtenerCuidadoresResponse(
      cuidadores: cuidadoresList,
    );
  }
}

class Cuidadores {
  final int idCuidador;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String correoE;
  final String usuario;
  final String direccion;
  final String telefono1;
  final String? telefono2;
  final String? pacienteAsignado;

  Cuidadores({
    required this.idCuidador,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.correoE,
    required this.usuario,
    required this.direccion,
    required this.telefono1,
    this.telefono2,
    this.pacienteAsignado,
  });

  factory Cuidadores.fromJson(Map<String, dynamic> json) {
    return Cuidadores(
      idCuidador: json['IdCuidador'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      correoE: json['CorreoE'],
      usuario: json['Usuario'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
      pacienteAsignado: json['PacienteAsignado'],
    );
  }
}
