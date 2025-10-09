class FamiliaresCuidadoresEditarInformacionCuentaAcceso {
  String? idFamiliar;
  String? tokenAcceso;
  String? idCuidador;
  String? correoE;
  String? usuario;

  FamiliaresCuidadoresEditarInformacionCuentaAcceso({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idCuidador,
    required this.correoE,
    required this.usuario,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdCuidador': idCuidador,
      'CorreoE': correoE,
      'Usuario': usuario,
    };
  }

  factory FamiliaresCuidadoresEditarInformacionCuentaAcceso.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresEditarInformacionCuentaAcceso(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idCuidador: json['IdCuidador'],
      correoE: json['CorreoE'],
      usuario: json['Usuario'],
    );
  }
}

class FamiliaresCuidadoresEditarInformacionCuentaAccesoResponse {
  String? message;

  FamiliaresCuidadoresEditarInformacionCuentaAccesoResponse({
    required this.message,
  });

  factory FamiliaresCuidadoresEditarInformacionCuentaAccesoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresCuidadoresEditarInformacionCuentaAccesoResponse(
      message: json['message'],
    );
  }
}
