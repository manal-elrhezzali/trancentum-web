import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/retour_fonds.dart';

class RetoursDeFonds with ChangeNotifier {
  List<RetourFonds> _items = [
    RetourFonds(
      banqueId: "B1",
      dCreation: DateTime.now().toIso8601String(),
      montant: 13452.76,
      nombre: 123,
      serie: "CCCCC",
      observation: "very good",
      etat: "en attente",
      codeExpedition: "123456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Remboursement",
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "223456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Cheque",
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "323456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Traite",
    ),
     RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "423456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Traite",
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "523456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Traite",
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "523456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Traite",
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "623456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/Traite",
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "723456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/BL",
    ),
     RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "823456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: "C/BL",
    ),

  ];
  
  List<RetourFonds> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  RetourFonds findById(String codeExpedition) {
    return _items.firstWhere(
        (retourFonds) => retourFonds.codeExpedition == codeExpedition,
        orElse: () => null);
  }
}
