import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trancentum_web_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        Uri.https('pfe-trancentum.herokuapp.com', '/api/public/$urlSegment');
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "accept": "*/*",
        },
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error'].toString());
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, "sign-up");
  }

  Future<void> login(String email, String password) async {
    final url = Uri.https('pfe-trancentum.herokuapp.com', '/api/public/login');
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "accept": "*/*",
        },
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      if (response.headers['authorization'] == null) {
        throw HttpException("Please enter valid credentials.");
      }
    } catch (error) {
      throw error;
    }
  }

  // Future<void> signUp(String email, String password) async {
  //   final url =
  //       Uri.https('pfe-trancentum.herokuapp.com', '/api/public/sign-up');
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "accept": "*/*",
  //       },
  //       body: json.encode(
  //         {
  //           'email': email,
  //           'password': password,
  //         },
  //       ),
  //     );
  //     print(json.decode(response.body));
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }
  // }

  // Future<void> login(String email, String password) async {
  //   final url = Uri.https('pfe-trancentum.herokuapp.com', '/api/public/login');

  //   return await http.post(
  //     url,
  //     headers: {
  //       "Content-Type": "application/json",
  //       "accept": "*/*",
  //     },
  //     body: json.encode(
  //       {
  //         'email': email,
  //         'password': password,
  //       },
  //     ),
  //   );
  // }
}
