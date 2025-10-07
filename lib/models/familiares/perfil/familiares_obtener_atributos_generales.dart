class FamiliaresObtenerAtributosGenerales {
  String? idFamiliar;
  String? tokenAcceso;

  FamiliaresObtenerAtributosGenerales({this.idFamiliar, this.tokenAcceso});
  Map<String, dynamic> toJson() => {
    'IdFamiliar': idFamiliar,
    'TokenAcceso': tokenAcceso,
  };

  factory FamiliaresObtenerAtributosGenerales.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresObtenerAtributosGenerales(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
    );
  }
}

class FamiliaresObtenerAtributosGeneralesResponse {
  int? numeroPacientes;
  int? numeroCuidadores;

  FamiliaresObtenerAtributosGeneralesResponse({
    this.numeroPacientes,
    this.numeroCuidadores,
  });

  factory FamiliaresObtenerAtributosGeneralesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresObtenerAtributosGeneralesResponse(
      numeroPacientes: json['NumeroPacientes'],
      numeroCuidadores: json['NumeroCuidadores'],
    );
  }
}
