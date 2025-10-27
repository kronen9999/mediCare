class FamiliaresChatbot {
  final String idFamiliar;
  final String mensaje;

  FamiliaresChatbot({required this.idFamiliar, required this.mensaje});

  factory FamiliaresChatbot.fromJson(Map<String, dynamic> json) {
    return FamiliaresChatbot(
      idFamiliar: json['IdFamiliar'] ?? '',
      mensaje: json['Mensaje'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'IdFamiliar': idFamiliar, 'Mensaje': mensaje};
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
