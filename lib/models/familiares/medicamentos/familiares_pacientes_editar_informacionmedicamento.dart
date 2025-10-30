class FamiliaresPacientesEditarInformacionmedicamento {
  final String idFamiliar;
  final String tokenAcceso;
  final String idPaciente;
  final String idMedicamento;
  final String nombreM;
  final String descripcionM;
  final String tipoMedicamento;
  final String unidadDosis;
  final String notas;

  FamiliaresPacientesEditarInformacionmedicamento({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
    required this.idMedicamento,
    required this.nombreM,
    required this.descripcionM,
    required this.tipoMedicamento,
    required this.unidadDosis,
    required this.notas,
  });

  Map<String, dynamic> toJson() {
    return {
      "IdFamiliar": idFamiliar,
      "TokenAcceso": tokenAcceso,
      "IdPaciente": idPaciente,
      "IdMedicamento": idMedicamento,
      "NombreM": nombreM,
      "DescripcionM": descripcionM,
      "TipoMedicamento": tipoMedicamento,
      "UnidadDosis": unidadDosis,
      "Notas": notas,
    };
  }
}

class FamiliaresPacientesEditarInformacionmedicamentoResponse {
  final String message;

  FamiliaresPacientesEditarInformacionmedicamentoResponse({
    required this.message,
  });

  factory FamiliaresPacientesEditarInformacionmedicamentoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesEditarInformacionmedicamentoResponse(
      message: json['message'],
    );
  }
}
