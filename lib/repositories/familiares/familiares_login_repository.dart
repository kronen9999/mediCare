import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicare/classes/globalvariables.dart';
import '../../models/familiares/familiales_login.dart';

class FamiliarLoginRepository {
  Globalvariables globalvariables = Globalvariables();
  final String url = Globalvariables().rutaGlobalBase;
  final String endpoint = 'Familiares/Login';

  Future<FamiliaresLoginResponse> login(FamilialesLogin loginData) async {
    final response = await http.post(
      Uri.parse(url + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginData.toJson()),
    );

    if (response.statusCode == 200) {
      return FamiliaresLoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
