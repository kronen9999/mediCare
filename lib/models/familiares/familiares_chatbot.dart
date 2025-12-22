class FamiliaresChatbot {
  final String idUsuario;
  final String mensaje;
  final String fechaActual;
  final String tipoUsuario;

  FamiliaresChatbot({
    required this.idUsuario,
    required this.mensaje,
    required this.fechaActual,
    required this.tipoUsuario,
  });

  factory FamiliaresChatbot.fromJson(Map<String, dynamic> json) {
    return FamiliaresChatbot(
      idUsuario: json['IdUsuario'] ?? '',
      mensaje: json['Mensaje'] ?? '',
      fechaActual: json['FechaActual'] ?? '',
      tipoUsuario: json['TipoUsuario'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdUsuario': idUsuario,
      'Mensaje': mensaje,
      'FechaActual': fechaActual,
      'TipoUsuario': tipoUsuario,
    };
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
