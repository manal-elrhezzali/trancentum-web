import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trancentum_web_app/models/http_exception.dart';

class Client with ChangeNotifier {
  final String authToken;
  final String userId;
  String _clientId;
  List _listOfClients = [];

  List get listOfClients {
    return [..._listOfClients];
  }

  Client(
    this.authToken,
    this.userId,
    // this._listOfClients
  );

  bool get isClient {
    return clientId != null;
  }

  String get clientId {
    if (_clientId != null) {
      return _clientId;
    }
    return null;
  }

  Future<void> createClient(
    String adresse,
    String cinRc,
    String code,
    String fax,
    String fixe,
    String ice,
    String nomRs,
    String tel,
  ) async {
    final url =
        Uri.https('pfe-trancentum.herokuapp.com', '/api/private/client');
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "accept": "*/*",
          "authorization": authToken
        },
        body: json.encode(
          {
            {
              "adresse": adresse,
              "cin_rc": cinRc,
              "code": code,
              "enCompte": 0,
              "faxe": fax,
              "fixe": fixe,
              "ice": ice,
              "nom_rs": nomRs,
              "tel": tel,
              "utilisateur_id": userId
            }
          },
        ),
      );
      print(response.body.toString());
      var responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['error'] != null) {
        print("CLIENT RESPONSE HAS ERROR KEY");
        throw HttpException("Failed to create a CLIENT!");
      }
      _clientId = responseData['id'];
      print(_clientId);
      notifyListeners();
    } catch (error) {
      print("IN CLIENT CATCH CLAUSE");
      throw error;
    }
  }

  Future<void> getClient() async {
    final url = Uri.https(
      'pfe-trancentum.herokuapp.com',
      '/api/private/clients',
      {"direction": "asc", "page": "0", "sort": "id"},
    );
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": authToken,
          "Content-Type": "application/json",
          "accept": "*/*",
        },
      );
      // print(response.body.toString());
      var responseData = json.decode(response.body);
      print(responseData);
      final List loadedClients = [];
      if (responseData['error'] != null) {
        print("Failed to create CLIENTS!");
        throw HttpException("Failed to create CLIENTS!");
      }
      final List extractedData = responseData['content'] as List<dynamic>;
      if (extractedData == null) {
        return;
      }
      var clientData = extractedData.firstWhere(
          (client) => client['utilisateur']['id'] == userId, orElse: () {
        return null;
      });
      if (clientData != null) {
        loadedClients.insert(0, clientData);
      }
      _listOfClients = loadedClients;
      notifyListeners();
      // if (listOfClients.isNotEmpty && _userId != null) {
      //   var result = listOfClients.firstWhere(
      //       (client) => client['utilisateur']['id'] == _userId, orElse: () {
      //     return null;
      //   });
      // }
    } catch (error) {
      print("IN GET CLIENTS CATCH CLAUSE");
      throw error;
    }
  }
}
