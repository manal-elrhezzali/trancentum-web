import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trancentum_web_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  DateTime _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    if (_userId != null) {
      return _userId;
    }
    return null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

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
        throw HttpException("Failed to create a USER!");
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
      _token = response.headers['authorization'];
      _userId = response.headers['userid'];
      print("In LOGIN: " + _userId);
      //token "expires" after 30 min
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            '1800',
          ),
        ),
      );
      notifyListeners();
      //setting up the sharedPreferences needs the method to be async
      //cuz sharedPreferences works with Future s
      //stores the userData in the device storage
      // final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode(
      //   {
      //     "token": _token,
      //     "userId": _userId,
      //     "expiryDate": _expiryDate.toIso8601String(),
      //   },
      // );
      // prefs.setString("userData", userData);
      
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
