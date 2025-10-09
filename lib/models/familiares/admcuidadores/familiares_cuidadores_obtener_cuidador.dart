class FamiliaresCuidadoresObtenerCuidador {
  String? idFamiliar;
  String? tokenAcceso;
  String? idCuidador;
  FamiliaresCuidadoresObtenerCuidador({
    this.idFamiliar,
    this.tokenAcceso,
    this.idCuidador,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdFamiliar'] = idFamiliar;
    data['TokenAcceso'] = tokenAcceso;
    data['IdCuidador'] = idCuidador;
    return data;
  }

  factory FamiliaresCuidadoresObtenerCuidador.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresObtenerCuidador(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idCuidador: json['IdCuidador'],
    );
  }
}

class FamiliaresCuidadoresObtenerCuidadorResponse {
  int? idCuidador;
  String? nombre;
  String? apellidoP;
  String? apellidoM;
  String? correoE;
  String? usuario;
  String? direccion;
  String? telefono1;
  String? telefono2;

  FamiliaresCuidadoresObtenerCuidadorResponse({
    this.idCuidador,
    this.nombre,
    this.apellidoP,
    this.apellidoM,
    this.correoE,
    this.usuario,
    this.direccion,
    this.telefono1,
    this.telefono2,
  });

  factory FamiliaresCuidadoresObtenerCuidadorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresObtenerCuidadorResponse(
      idCuidador: json['IdCuidador'],
      nombre: json['Nombre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      correoE: json['CorreoE'],
      usuario: json['Usuario'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdCuidador'] = idCuidador;
    data['Nombre'] = nombre;
    data['ApellidoP'] = apellidoP;
    data['ApellidoM'] = apellidoM;
    data['CorreoE'] = correoE;
    data['Usuario'] = usuario;
    data['Direccion'] = direccion;
    data['Telefono1'] = telefono1;
    data['Telefono2'] = telefono2;
    return data;
  }
}
