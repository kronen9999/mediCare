class CuidadoresAlertafamiliar {
  String usuario;

  CuidadoresAlertafamiliar({required this.usuario});

  Map<String, dynamic> toJson() {
    return {'Usuario': usuario};
  }

  factory CuidadoresAlertafamiliar.fromJson(Map<String, dynamic> json) {
    return CuidadoresAlertafamiliar(usuario: json['Usuario']);
  }
}

class CuidadoresAlertaFamiliarResponse {
  String message;

  CuidadoresAlertaFamiliarResponse({required this.message});

  factory CuidadoresAlertaFamiliarResponse.fromJson(Map<String, dynamic> json) {
    return CuidadoresAlertaFamiliarResponse(message: json['message']);
  }
}
