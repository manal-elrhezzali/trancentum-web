// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:trancentum_web_app/models/client_request_model.dart';
// import 'package:trancentum_web_app/models/http_exception.dart';

// class Client with ChangeNotifier {
//   final String authToken;
//   final String userId;
//   String _clientId;
//   List _listOfClients = [];

//   List get listOfClients {
//     return [..._listOfClients];
//   }

//   Client(
//     this.authToken,
//     this.userId,
//   );

//   String get clientId {
//     if (_clientId != null) {
//       return _clientId;
//     }
//     return null;
//   }

//   String get utilisateurId {
//     if (userId != null) {
//       return userId;
//     }
//     return null;
//   }

//   Future<void> createClient(ClientRequestModel client) async {
//     final url =
//         Uri.https('pfe-trancentum.herokuapp.com', '/api/private/client');
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "accept": "*/*",
//           "authorization": authToken
//         },
//         body: jsonEncode(client),
//       );
//       print(response.body.toString());
//       var responseData = json.decode(response.body);
//       if (responseData['error'] != null) {
//         print(responseData);
//         throw HttpException("Failed to create a CLIENT!");
//       }
//       _clientId = responseData['id'];
//       notifyListeners();
//     } catch (error) {
//       print(error.toString());
//       throw error;
//     }
//   }

//   Future<void> getClient() async {
//     final url = Uri.https(
//       'pfe-trancentum.herokuapp.com',
//       '/api/private/clients',
//       {"direction": "asc", "page": "0", "sort": "id"},
//     );
//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           "Authorization": authToken,
//           "Content-Type": "application/json",
//           "accept": "*/*",
//         },
//       );
//       var responseData = json.decode(response.body);
//       // print(responseData);
//       final List loadedClients = [];
//       if (responseData['error'] != null) {
//         throw HttpException("Failed to create CLIENTS!");
//       }
//       final List extractedData = responseData['content'] as List<dynamic>;
//       if (extractedData == null) {
//         return;
//       }
//       var clientData = extractedData.firstWhere(
//           (client) => client['utilisateur']['id'] == userId, orElse: () {
//         return null;
//       });
//       if (clientData != null) {
//         loadedClients.insert(0, clientData);
//       }
//       _listOfClients = loadedClients;
//       notifyListeners();
//     } catch (error) {
//       throw error;
//     }
//   }
// }
