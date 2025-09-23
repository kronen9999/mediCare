import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicare/classes/globalvariables.dart';
import 'package:medicare/models/familiares/familiares_registro.dart';

class FamiliaresRegistroRepository {
  Globalvariables rutaGlobal = Globalvariables();
  final String urlBase = Globalvariables().rutaGlobalBase;
  final String endpoint = 'Familiares/Registro';

  Future<FamiliaresRegistroResponse> registro(
    FamiliaresRegistro registroData,
  ) async {
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registroData.toJson()),
    );
    if (response.statusCode == 201) {
      return FamiliaresRegistroResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
