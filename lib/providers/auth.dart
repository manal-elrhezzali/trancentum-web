import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  Future<void> signUp(String email, String password) async {
    final url =
        Uri.parse('https://pfe-trancentum.herokuapp.com/api/public/sign-up');
    final response = await http.post(
      url,
      body: json.encode(
        {
          "email": email,
          "password": password,
        },
      ),
    );
    print(json.decode(response.body));
  }
}
