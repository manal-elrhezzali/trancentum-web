import 'package:flutter/material.dart';

import '../models/expedition.dart';

class Expeditions with ChangeNotifier {
  List<Expedition> _items = [
    // Expedition(
    //     clientDestinataireId: "c3",
    //     clientExpediteurId: "c1",
    //     codeABarre: "123456789",
    //     codeExpedition: "123456",
    //     codeGenere: "123456",
    //     etat: "Chargée",
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 11,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Forfait",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v2",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //   clientDestinataireId: "c2",
    //   clientExpediteurId: "c1",
    //   codeABarre: "223456789",
    //   codeExpedition: "223456",
    //   codeGenere: "223456",
    //   etat: "Clôturée",
    //   dCloturation: DateTime.now(),
    //   dLivraison: DateTime.now(),
    //   dcreation: DateTime.now(),
    //   modePaiement: "PDE",
    //   nbrColis: 12,
    //   nbrFactures: 15,
    //   pht: 12098,
    //   premise: 12.32,
    //   ptaxe1: 11.34,
    //   ptaxe2: 10.34,
    //   ptaxe3: 12.32,
    //   ptaxe4: 12.32,
    //   pttc: 12.32,
    //   ptva: 12.32,
    //   taxation: "TypeTaxationService",
    //   ttlPoids: 12.32,
    //   ttlValDeclaree: 12.32,
    //   typeLivraison: "a domicile",
    //   villeDestinataireId: "v1",
    //   villeExpediteurId: "v2",
    // ),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "323456",
    //     codeGenere: "323456",
    //     etat: "Enregistrée",
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Service",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "423456",
    //     codeGenere: "323456",
    //     etat: "Livrée",
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PDE",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Taxation",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "523456",
    //     codeGenere: "323456",
    //     etat: "Reçue",
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PPE",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Taxation",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "623456",
    //     codeGenere: "323456",
    //     etat: "Retour",
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Forfait",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c3",
    //     clientExpediteurId: "c1",
    //     codeABarre: "123456789",
    //     codeExpedition: "723456",
    //     codeGenere: "123456",
    //     etat: "Chargée",
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PPE",
    //     nbrColis: 11,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Service",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v2",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //   clientDestinataireId: "c3",
    //   clientExpediteurId: "c1",
    //   codeABarre: "123456789",
    //   codeExpedition: "823456",
    //   codeGenere: "123456",
    //   etat: "Clôturée",
    //   dCloturation: DateTime.now(),
    //   dLivraison: DateTime.now(),
    //   dcreation: DateTime.now(),
    //   modePaiement: "PD",
    //   nbrColis: 11,
    //   nbrFactures: 15,
    //   pht: 12098,
    //   premise: 12.32,
    //   ptaxe1: 11.34,
    //   ptaxe2: 10.34,
    //   ptaxe3: 12.32,
    //   ptaxe4: 12.32,
    //   pttc: 12.32,
    //   ptva: 12.32,
    //   taxation: "Taxation",
    //   ttlPoids: 12.32,
    //   ttlValDeclaree: 12.32,
    //   typeLivraison: "a domicile",
    //   villeDestinataireId: "v2",
    //   villeExpediteurId: "v1",
    // ),
  ];
  final String authToken;
  final String clientId;

  Expeditions(this.authToken, this.clientId, this._items);

  int _expeditionEnregistreeCount;
  int _expeditionRecueCount;
  int _expeditionChargeeCount;
  int _expeditionLivreeCount;
  int _expeditionRetourCount;
  int _expeditionClotureeCount;

  List<Expedition> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  int get nbrOfExpeditionsRetour {
    _expeditionRetourCount = 0;
    _items.forEach((element) {
      if (element.etat == "Retour") {
        _expeditionRetourCount++;
      }
    });
    return _expeditionRetourCount;
  }

  int get nbrOfExpeditionsRecue {
    _expeditionRecueCount = 0;
    _items.forEach((element) {
      if (element.etat == "Reçue") {
        _expeditionRecueCount++;
      }
    });
    return _expeditionRecueCount;
  }

  int get nbrOfExpeditionsEnregistree {
    _expeditionEnregistreeCount = 0;
    _items.forEach((element) {
      if (element.etat == "Enregistrée") {
        _expeditionEnregistreeCount++;
      }
    });
    return _expeditionEnregistreeCount;
  }

  int get nbrOfExpeditionsLivree {
    _expeditionLivreeCount = 0;
    _items.forEach((element) {
      if (element.etat == "Livrée") {
        _expeditionLivreeCount++;
      }
    });
    return _expeditionLivreeCount;
  }

  int get nbrOfExpeditionsChargee {
    _expeditionChargeeCount = 0;
    _items.forEach((element) {
      if (element.etat == "Chargée") {
        _expeditionChargeeCount++;
      }
    });
    return _expeditionChargeeCount;
  }

  int get nbrOfExpeditionsCloturee {
    _expeditionClotureeCount = 0;
    _items.forEach((element) {
      if (element.etat == "Clôturée") {
        _expeditionClotureeCount++;
      }
    });
    return _expeditionClotureeCount;
  }

  Expedition findById(String codeExpedition) {
    return _items.firstWhere(
        (expedition) => expedition.codeExpedition == codeExpedition,
        orElse: () => null);
  }

  List<Expedition> getExpeditionsByState(String state) {
    return (_items.where((expedition) => expedition.etat == state)).toList();
  }

  double calculatePercentageOfExpeditionsPerStatus(
      int totalNbrOfExpeditions, int totalNbrOfExpeditionsOfStatus) {
    return totalNbrOfExpeditionsOfStatus / totalNbrOfExpeditions;
  }

  void addExpedition(Expedition expedition) {
    final newExpedition = Expedition(
      clientDestinataireId: expedition.clientDestinataireId,
      clientExpediteurId: expedition.clientExpediteurId,
      codeExpedition: expedition.codeExpedition,
      dcreation: expedition.dcreation,
      etat: expedition.etat,
      modePaiement: expedition.modePaiement,
      nbrColis: expedition.nbrColis,
      nbrFactures: expedition.nbrFactures,
      pht: expedition.pht,
      premise: expedition.premise,
      ptaxe1: expedition.ptaxe1,
      ptaxe2: expedition.ptaxe2,
      ptaxe3: expedition.ptaxe3,
      ptaxe4: expedition.ptaxe4,
      pttc: expedition.pttc,
      ptva: expedition.ptva,
      taxation: expedition.taxation,
      ttlPoids: expedition.ttlPoids,
      ttlValDeclaree: expedition.ttlValDeclaree,
      typeLivraison: expedition.typeLivraison,
      villeDestinataireId: expedition.villeDestinataireId,
      villeExpediteurId: expedition.villeExpediteurId,
      codeABarre: expedition.codeABarre,
      codeGenere: expedition.codeGenere,
      dCloturation: expedition.dCloturation,
      dLivraison: expedition.dLivraison,
    );
    _items.add(newExpedition);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  // void deleteExpedition(String codeExpedition) {
  //   _items.removeWhere(
  //       (expedition) => expedition.codeExpedition == codeExpedition);
  //   notifyListeners();
  // }
}
