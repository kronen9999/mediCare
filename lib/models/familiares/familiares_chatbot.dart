class FamiliaresChatbot {
  final String idUsuario;
  final String mensaje;

  FamiliaresChatbot({required this.idUsuario, required this.mensaje});

  factory FamiliaresChatbot.fromJson(Map<String, dynamic> json) {
    return FamiliaresChatbot(
      idUsuario: json['IdUsuario'] ?? '',
      mensaje: json['Mensaje'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdUsuario': idUsuario, 'Mensaje': mensaje};
  }
}

class FamiliaresChatbotResponse {
  final String response;

  FamiliaresChatbotResponse({required this.response});

  factory FamiliaresChatbotResponse.fromJson(Map<String, dynamic> json) {
    return FamiliaresChatbotResponse(response: json['Response'] ?? '');
  }
}

List<FamiliaresChatbotResponse> parseResponses(List<dynamic> jsonList) {
  return jsonList
      .map((json) => FamiliaresChatbotResponse.fromJson(json))
      .toList();
}
