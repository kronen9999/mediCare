import 'dart:convert';

import 'package:medicare/classes/globalvariables.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/models/cuidadores/cuidadores_login.dart';

class CuidadoresRepositoryGlobal {
  Globalvariables variableGlobal = Globalvariables();

  //metodo para el login de los cuidadores

  Future<CuidadoresLoginResponse> loginCuidador(
    CuidadoresLogin loginData,
  ) async {
    String urlBase = variableGlobal.rutaGlobalBase;
    String endpoint = 'Cuidadores/login';
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginData.toJson()),
    );

    if (response.statusCode == 200) {
      return CuidadoresLoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
