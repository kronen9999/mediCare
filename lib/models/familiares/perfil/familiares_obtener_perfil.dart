class FamiliaresObtenerPerfil {
  String? idFamiliar;
  String? tokenAcceso;

  FamiliaresObtenerPerfil({this.idFamiliar, this.tokenAcceso});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdFamiliar'] = idFamiliar;
    data['TokenAcceso'] = tokenAcceso;
    return data;
  }

  factory FamiliaresObtenerPerfil.fromJson(Map<String, dynamic> json) {
    return FamiliaresObtenerPerfil(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class FamiliaresObtenerPerfilResponse {
  InformacionPersonal? informacionPersonal;
  InformacionCuenta? informacionCuenta;

  FamiliaresObtenerPerfilResponse({
    this.informacionPersonal,
    this.informacionCuenta,
  });

  factory FamiliaresObtenerPerfilResponse.fromJson(Map<String, dynamic> json) {
    return FamiliaresObtenerPerfilResponse(
      informacionPersonal: json['InformacionPersonal'] != null
          ? InformacionPersonal.fromJson(json['InformacionPersonal'])
          : null,
      informacionCuenta: json['InformacionCuenta'] != null
          ? InformacionCuenta.fromJson(json['InformacionCuenta'])
          : null,
    );
  }
}

class InformacionPersonal {
  String? nombbre;
  String? apellidoP;
  String? apellidoM;
  String? direccion;
  String? telefono1;
  String? telefono2;

  InformacionPersonal({
    required this.nombbre,
    required this.apellidoP,
    required this.apellidoM,
    required this.direccion,
    required this.telefono1,
    required this.telefono2,
  });

  factory InformacionPersonal.fromJson(Map<String, dynamic> json) {
    return InformacionPersonal(
      nombbre: json['Nombbre'],
      apellidoP: json['ApellidoP'],
      apellidoM: json['ApellidoM'],
      direccion: json['Direccion'],
      telefono1: json['Telefono1'],
      telefono2: json['Telefono2'],
    );
  }
}

class InformacionCuenta {
  String? correoE;
  String? usuario;

  InformacionCuenta({required this.correoE, required this.usuario});

  factory InformacionCuenta.fromJson(Map<String, dynamic> json) {
    return InformacionCuenta(
      correoE: json['CorreoE'],
      usuario: json['Usuario'],
    );
  }
}
