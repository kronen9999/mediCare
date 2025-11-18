class FamiliaresPacientesObtenermedicamentos {
  String idFamiliar;
  String tokenAcceso;
  String idPaciente;

  FamiliaresPacientesObtenermedicamentos({
    required this.idFamiliar,
    required this.tokenAcceso,
    required this.idPaciente,
  });

  Map<String, dynamic> toJson() {
    return {
      'IdFamiliar': idFamiliar,
      'TokenAcceso': tokenAcceso,
      'IdPaciente': idPaciente,
    };
  }

  factory FamiliaresPacientesObtenermedicamentos.fromJson(
    Map<String, dynamic> json,
  ) {
    return FamiliaresPacientesObtenermedicamentos(
      idFamiliar: json['IdFamiliar'],
      tokenAcceso: json['TokenAcceso'],
      idPaciente: json['IdPaciente'],
    );
  }
}

class FamiliaresPacientesObtenermedicamentosResponse {
  List<Medicamentos> medicamentos;

  FamiliaresPacientesObtenermedicamentosResponse({required this.medicamentos});

  factory FamiliaresPacientesObtenermedicamentosResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    var medicamentosJson = json['Medicamentos'] as List;
    List<Medicamentos> medicamentosList = medicamentosJson
        .map((medicamentoJson) => Medicamentos.fromJson(medicamentoJson))
        .toList();

    return FamiliaresPacientesObtenermedicamentosResponse(
      medicamentos: medicamentosList,
    );
  }
}

class Medicamentos {
  int idMedicamento;
  String? nombreM;
  String? descripcionM;
  String? tipoMedicamento;
  int medicamentoActivo;

  Medicamentos({
    required this.idMedicamento,
    required this.nombreM,
    required this.descripcionM,
    required this.tipoMedicamento,
    required this.medicamentoActivo,
  });

  factory Medicamentos.fromJson(Map<String, dynamic> json) {
    return Medicamentos(
      idMedicamento: json['IdMedicamento'],
      nombreM: json['NombreM'],
      descripcionM: json['DescripcionM'],
      tipoMedicamento: json['TipoMedicamento'],
      medicamentoActivo: json['MedicamentoActivo'],
    );
  }
}
