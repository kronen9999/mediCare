class FamiliaresVerificarcodigorecuperacion {
  String correoE;
  String codigoVerificacion;

  FamiliaresVerificarcodigorecuperacion({
    required this.correoE,
    required this.codigoVerificacion,
  });

  Map<String, dynamic> toJson() => {
    'CorreoE': correoE,
    'CodigoVerificacion': codigoVerificacion,
  };

  factory FamiliaresVerificarcodigorecuperacion.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresVerificarcodigorecuperacion(
      correoE: json['CorreoE'],
      codigoVerificacion: json['CodigoVerificacion'],
    );
  }
}

class FamiliaresVerificarcodigorecuperacionResponse {
  String message;

  FamiliaresVerificarcodigorecuperacionResponse({required this.message});

  factory FamiliaresVerificarcodigorecuperacionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresVerificarcodigorecuperacionResponse(
      message: json['message'],
    );
  }
}
