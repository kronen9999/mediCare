class FamiliarPacientesEditarPaciente {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String padecimiento;
  final String direccion;
  final String telefono1;
  final String telefono2;

  FamiliarPacientesEditarPaciente({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.padecimiento,
    required this.direccion,
    required this.telefono1,
    required this.telefono2,
  });

  factory FamiliarPacientesEditarPaciente.fromJson(Map<String, dynamic> json) {
    return FamiliarPacientesEditarPaciente(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      padecimiento: json['Padecimiento'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
      'Nombre': nombre,
      'ApellidoP': apellidoP,
      'ApellidoM': apellidoM,
      'Padecimiento': padecimiento,
      'Direccion': direccion,
      'Telefono1': telefono1,
      'Telefono2': telefono2,
    };
  }
}

class FamiliarPacientesEditarPacienteResponse {
  final String? message;

  FamiliarPacientesEditarPacienteResponse({required this.message});

  factory FamiliarPacientesEditarPacienteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliarPacientesEditarPacienteResponse(message: json['message']);
  }
}
