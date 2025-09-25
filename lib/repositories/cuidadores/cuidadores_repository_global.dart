import 'dart:convert';

import 'package:medicare/classes/globalvariables.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/models/cuidadores/cuidadores_login.dart';
import 'package:medicare/models/cuidadores/cuidadores_recupearcuentapcorreo.dart';

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

  //metodo para enviar el codigo de recuperacion via correo

  Future<CuidadoresRecupearcuentapcorreoResponse> enviarCodigoRecuperacion(
    CuidadoresRecupearcuentapcorreo recuperarData,
  ) async {
    final String urlBase = variableGlobal.rutaGlobalBase;
    final String endpoint = 'Cuidadores/RecupearCuentaPCorreo';
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recuperarData.toJson()),
    );

    if (response.statusCode == 200) {
      return CuidadoresRecupearcuentapcorreoResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)['error']);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
