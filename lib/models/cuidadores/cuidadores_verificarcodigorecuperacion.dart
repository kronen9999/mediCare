class CuidadoresVerificarcodigorecuperacion {
  String correoE;
  String codigoVerificacion;
  CuidadoresVerificarcodigorecuperacion({
    required this.correoE,
    required this.codigoVerificacion,
  });
  Map<String, dynamic> toJson() {
    return {'CorreoE': correoE, 'CodigoVerificacion': codigoVerificacion};
  }

  factory CuidadoresVerificarcodigorecuperacion.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresVerificarcodigorecuperacion(
      correoE: json['CorreoE'],
      codigoVerificacion: json['CodigoVerificacion'],
    );
  }
}

class CuidadoresVerificarcodigorecuperacionResponse {
  String message;
  CuidadoresVerificarcodigorecuperacionResponse({required this.message});
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory CuidadoresVerificarcodigorecuperacionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresVerificarcodigorecuperacionResponse(
      message: json['message'],
    );
  }
}
