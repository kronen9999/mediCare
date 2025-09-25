class CuidadoresRecupearcuentapcorreo {
  String correoE;

  CuidadoresRecupearcuentapcorreo({required this.correoE});

  Map<String, dynamic> toJson() {
    return {'CorreoE': correoE};
  }

  factory CuidadoresRecupearcuentapcorreo.fromJson(Map<String, dynamic> json) {
    return CuidadoresRecupearcuentapcorreo(correoE: json['CorreoE']);
  }
}

class CuidadoresRecupearcuentapcorreoResponse {
  String message;

  CuidadoresRecupearcuentapcorreoResponse({required this.message});

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory CuidadoresRecupearcuentapcorreoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuidadoresRecupearcuentapcorreoResponse(message: json['message']);
  }
}
