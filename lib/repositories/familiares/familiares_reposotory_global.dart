import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicare/classes/globalvariables.dart';
import 'package:medicare/models/familiares/familiares_recuperarcuentapcorreo.dart';
import 'package:medicare/models/familiares/familiares_restablecercontrasena.dart';
import 'package:medicare/models/familiares/familiares_verificarcodigorecuperacion.dart';
import 'package:medicare/models/familiares/perfil/familiares_actualizar_informacion_cuenta.dart';
import 'package:medicare/models/familiares/perfil/familiares_actualizar_informacion_personal.dart';
import 'package:medicare/models/familiares/perfil/familiares_obtener_atributos_generales.dart';
import 'package:medicare/models/familiares/perfil/familiares_obtener_perfil.dart';

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

  //metodo para verificar el codigo de recuperacion

  Future<FamiliaresVerificarcodigorecuperacionResponse>
  verificarCodigoRecuperacion(
    FamiliaresVerificarcodigorecuperacion verificarData,
  ) async {
    final response = await http.post(
      Uri.parse('${urlBase}Familiares/VerificarCodigoRecuperacion'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(verificarData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresVerificarcodigorecuperacionResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  //metodo para restablecer la contrasena

  Future<FamiliaresRestablecercontrasenaResponse> restablecerContrasena(
    FamiliaresRestablecercontrasena restablecerData,
  ) async {
    final response = await http.post(
      Uri.parse('${urlBase}Familiares/RestablecerContrasena'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(restablecerData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresRestablecercontrasenaResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
  //Metodo para obtener la informacion personal de un familiar

  Future<FamiliaresObtenerPerfilResponse> obtenerPerfil(
    FamiliaresObtenerPerfil perfilData,
  ) async {
    final response = await http.post(
      Uri.parse('${urlBase}Familiares/Perfil/ObtenerPerfil'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(perfilData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresObtenerPerfilResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  //Metodo para obtener los atributos generales de un familiar

  Future<FamiliaresObtenerAtributosGeneralesResponse> obtenerAtributosGenerales(
    FamiliaresObtenerAtributosGenerales atributosData,
  ) async {
    final response = await http.post(
      Uri.parse('${urlBase}Familiares/ObtenerAtributosGenerales'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(atributosData.toJson()),
    );
    if (response.statusCode == 200) {
      return FamiliaresObtenerAtributosGeneralesResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  //Metodo para editar la informacion personal del familiar

  Future<FamiliaresActualizarInformacionPersonalResponse>
  actualizarDatosPersonales(
    FamiliaresActualizarInformacionPersonal informacionData,
  ) async {
    final response = await http.post(
      Uri.parse('${urlBase}Familiares/Perfil/ActualizarInformacionPersonal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(informacionData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresActualizarInformacionPersonalResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  //Metodo para editar la informacion de la cuenta del familiar

  Future<FamiliaresActualizarInformacionCuentaResponse> actualizarDatosCuenta(
    FamiliaresActualizarInformacionCuenta cuentaData,
  ) async {
    final response = await http.post(
      Uri.parse('${urlBase}Familiares/Perfil/ActualizarInformacionCuenta'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cuentaData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresActualizarInformacionCuentaResponse.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 422) {
      throw Exception(jsonDecode(response.body)["error"]);
    } else if (response.statusCode == 404) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)["message"]);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
