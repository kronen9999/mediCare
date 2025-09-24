import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicare/classes/globalvariables.dart';
import 'package:medicare/models/familiares/familiares_recuperarcuentapcorreo.dart';

class FamiliaresReposotoryGlobal {
  Globalvariables rutaGlobal = Globalvariables();
  final String urlBase = Globalvariables().rutaGlobalBase;
  final String endpoint = 'Familiares/RecupearCuentaPCorreo';

  //metodo para recuperar cuenta por correo

  Future<FamiliaresRecuperarcuentapcorreoResponse> recuperarCuentaPCorreo(
    FamiliaresRecuperarcuentapcorreo recuperarData,
  ) async {
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recuperarData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresRecuperarcuentapcorreoResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
