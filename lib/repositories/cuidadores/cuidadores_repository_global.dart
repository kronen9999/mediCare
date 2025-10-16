import 'dart:convert';

import 'package:medicare/classes/globalvariables.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/models/cuidadores/cuidadores_alertafamiliar.dart';
import 'package:medicare/models/cuidadores/cuidadores_login.dart';
import 'package:medicare/models/cuidadores/cuidadores_recupearcuentapcorreo.dart';
import 'package:medicare/models/cuidadores/cuidadores_restablecercontrasena.dart';
import 'package:medicare/models/cuidadores/cuidadores_verificarcodigorecuperacion.dart';
import 'package:medicare/models/cuidadores/perfil/cuidadores_perfil_obtenerperfil.dart';
import 'package:medicare/models/familiares/perfil/familiares_obtener_perfil.dart';

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

  //metodo para verificar el codigo de recuperacion

  Future<CuidadoresVerificarcodigorecuperacionResponse> verificarCodigo(
    CuidadoresVerificarcodigorecuperacion recuperarData,
  ) async {
    final String urlBase = variableGlobal.rutaGlobalBase;
    final String endpoint = 'Cuidadores/VerificarCodigoRecuperacion';
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recuperarData.toJson()),
    );

    if (response.statusCode == 200) {
      return CuidadoresVerificarcodigorecuperacionResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)['error']);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  //metodo para restablecer la contrasena del cuidador

  Future<CuidadoresRestablecercontrasenaResponse> restablerContrasena(
    CuidadoresRestablecercontrasena restablecerData,
  ) async {
    final String urlBase = variableGlobal.rutaGlobalBase;
    final String endpoint = 'Cuidadores/RestablecerContrasena';
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(restablecerData.toJson()),
    );

    if (response.statusCode == 200) {
      return CuidadoresRestablecercontrasenaResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)['error']);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  //metodo para enviar alerta a familiar

  Future<CuidadoresAlertaFamiliarResponse> alertaFamiliar(
    CuidadoresAlertafamiliar alertaData,
  ) async {
    final String urlBase = variableGlobal.rutaGlobalBase;
    final String endpoint = 'Cuidadores/AlertaFamiliar';

    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(alertaData.toJson()),
    );

    if (response.statusCode == 200) {
      return CuidadoresAlertaFamiliarResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)['error']);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
  //Metodos para el perfil de los cuidadores

  Future<CuidadoresPerfilObtenerperfilResponse> obtenerPerfil(
    CuidadoresPerfilObtenerperfil perfilData,
  ) async {
    final String urlBase = variableGlobal.rutaGlobalBase;
    final String endpoint = 'Cuidadores/Perfil/ObtenerPerfilCompleto';
    final response = await http.post(
      Uri.parse(urlBase + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(perfilData.toJson()),
    );

    if (response.statusCode == 200) {
      return CuidadoresPerfilObtenerperfilResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)['error']);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)['error']);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)['error']);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
