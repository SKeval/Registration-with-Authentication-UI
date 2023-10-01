import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepo {
  Future<String> getDetails(String username, String password) async {
    String url = "https://fakestoreapi.com/auth/login";
    Map<String, String> body = {'username': username, 'password': password};
    var response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode != 200) {
      return 'NA';
    }

    try {
      return jsonDecode(response.body)['token'];
    } catch (e) {
      return 'Catch NA';
    }
  }
}
