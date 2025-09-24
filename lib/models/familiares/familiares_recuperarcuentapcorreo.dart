class FamiliaresRecuperarcuentapcorreo {
  String correoE;

  FamiliaresRecuperarcuentapcorreo({required this.correoE});

  Map<String, dynamic> toJson() {
    return {'CorreoE': correoE};
  }

  factory FamiliaresRecuperarcuentapcorreo.fromJson(Map<String, dynamic> json) {
    return FamiliaresRecuperarcuentapcorreo(correoE: json['CorreoE']);
  }
}

class FamiliaresRecuperarcuentapcorreoResponse {
  String message;

  FamiliaresRecuperarcuentapcorreoResponse({required this.message});

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  factory FamiliaresRecuperarcuentapcorreoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresRecuperarcuentapcorreoResponse(message: json['message']);
  }
}
