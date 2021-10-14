import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trancentum_web_app/models/http_exception.dart';

import '../models/expedition.dart';

class Expeditions with ChangeNotifier {
  List<Expedition> _items = [];

  List<Expedition> _searchedItems = [];
  List<Expedition> _expeditionsEtatBrouillon = [];

  List<String> _codeExpeditionsList = [];

  List<Expedition> get brouillonExpeditions {
    List<Expedition> temp = [];
    _items.forEach((element) {
      if (element.etat == "Brouillon") {
        temp.add(element);
      }
    });
    _expeditionsEtatBrouillon = temp;
    return [..._expeditionsEtatBrouillon];
  }

  List<Expedition> get searchedItems {
    List<Expedition> temp = [];
    _items.forEach((element) {
      if (_codeExpeditionsList.contains(element.codeExpedition)) {
        temp.add(element);
      }
    });
    _searchedItems = temp;
    return [..._searchedItems];
  }

  Future<void> storeSearchedCodeExpedition(String codeExpedition) async {
    if (codeExpedition == null) {
      return;
    }
    _codeExpeditionsList.add(codeExpedition);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("searchedExpeditionsCodes", _codeExpeditionsList);
  }

  final String authToken;
  final String userId;

  Expeditions(this.authToken, this.userId, this._items);

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
      orElse: () => null,
    );
  }

  List<Expedition> getExpeditionsByState(String state) {
    return (_items.where((expedition) => expedition.etat == state)).toList();
  }

  double calculatePercentageOfExpeditionsPerStatus(
      int totalNbrOfExpeditions, int totalNbrOfExpeditionsOfStatus) {
    if (totalNbrOfExpeditions == 0) {
      return 0.0;
    }
    return totalNbrOfExpeditionsOfStatus / totalNbrOfExpeditions;
  }

  Future<void> fetchAndSetExpeditions() async {
    final url = Uri.https(
      'pfe-trancentum-flutter-app-default-rtdb.firebaseio.com',
      '/expeditions.json',
      {
        'auth': authToken,
        //  'orderBy': "creatorId",
        //  'equalTo': userId,
      },
    ); //what's the key to pass userId?
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<Expedition> loadedExpeditions = [];
      extractedData.forEach((codeExped, expeditionData) {
        if (expeditionData['creatorId'] == userId) {
          loadedExpeditions.add(Expedition(
            nomExpediteur: expeditionData['nomExpediteur'],
            telExpediteur: expeditionData['telExpediteur'],
            nomDestinataire: expeditionData['nomDestinataire'],
            telDestinataire: expeditionData['telDestinataire'],
            codeABarre: expeditionData['codeABarre'],
            codeExpedition: codeExped,
            codeGenere: expeditionData['codeGenere'],
            dCloturation: expeditionData['dCloturation'],
            dLivraison: expeditionData['dLivraison'],
            dcreation: DateTime.parse(expeditionData['dcreation']),
            etat: expeditionData['etat'],
            modePaiement: expeditionData['modePaiement'],
            nbrColis: expeditionData['nbrColis'],
            nbrFactures: expeditionData['nbrFactures'],
            pht: expeditionData['pht'],
            premise: expeditionData['premise'],
            ptaxe1: expeditionData['ptaxe1'],
            ptaxe2: expeditionData['ptaxe2'],
            ptaxe3: expeditionData['ptaxe3'],
            ptaxe4: expeditionData['ptaxe4'],
            pttc: expeditionData['pttc'],
            ptva: expeditionData['ptva'],
            taxation: expeditionData['taxation'],
            ttlPoids: expeditionData['ttlPoids'],
            ttlValDeclaree: expeditionData['ttlValDeclaree'],
            typeLivraison: expeditionData['typeLivraison'],
            villeDestinataireId: expeditionData['villeDestinataireId'],
            villeExpediteurId: expeditionData['villeExpediteurId'],
            //reglement
            typeTaxation: expeditionData['typeTaxation'],
            montantHT: expeditionData['montantHT'],
            montantTVA: expeditionData['montantTVA'],
            montantTTC: expeditionData['montantTTC'],
            nombre: expeditionData['nombre'],
            poids: expeditionData['poids'],
            typeMarchandise: expeditionData['typeMarchandise'],
            valeurDeclaree: expeditionData['valeurDeclaree'],
            fraisHTperColis: expeditionData['fraisHTperColis'],
            fraisHTTotal: expeditionData['fraisHTTotal'],
            //retours fonds
            nombreBonsLivraison: expeditionData['nombreBonsLivraison'],
            banqueId: expeditionData['banqueId'],
            dEnvoi: expeditionData['dEnvoi'],
            montant: expeditionData['montant'],
            observation: expeditionData['observation'],
            serie: expeditionData['serie'],
            type: expeditionData['type'],
          ));
        }
      });
      _items = loadedExpeditions;
      notifyListeners();
    } catch (error) {
      print("-------------------------" + error + "-------------------------");
      throw (error);
    }
  }

  Future<void> addExpedition(Expedition expedition) async {
    final url = Uri.https(
      'pfe-trancentum-flutter-app-default-rtdb.firebaseio.com',
      '/expeditions.json',
      {'auth': authToken},
    );
    final timestamp = DateTime.now();
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'creatorId': userId,
          'nomExpediteur': expedition.nomExpediteur,
          'telExpediteur': expedition.telExpediteur,
          'nomDestinataire': expedition.nomDestinataire,
          'telDestinataire': expedition.telDestinataire,
          'codeABarre': expedition.codeABarre,
          'dCloturation': expedition.dCloturation,
          'dLivraison': expedition.dLivraison,
          'dcreation': timestamp.toIso8601String(),
          'etat': expedition.etat,
          'modePaiement': expedition.modePaiement,
          'nbrColis': expedition.nbrColis,
          'nbrFactures': expedition.nbrFactures,
          'pht': expedition.pht,
          'premise': expedition.premise,
          'ptaxe1': expedition.ptaxe1,
          'ptaxe2': expedition.ptaxe2,
          'ptaxe3': expedition.ptaxe3,
          'ptaxe4': expedition.ptaxe4,
          'pttc': expedition.pttc,
          'ptva': expedition.ptva,
          'taxation': expedition.taxation,
          'ttlPoids': expedition.ttlPoids,
          'ttlValDeclaree': expedition.ttlValDeclaree,
          'typeLivraison': expedition.typeLivraison,
          'villeDestinataireId': expedition.villeDestinataireId,
          'villeExpediteurId': expedition.villeExpediteurId, //reglement
          'typeTaxation': expedition.typeTaxation,
          'montantHT': expedition.montantHT,
          'montantTVA': expedition.montantTVA,
          'montantTTC': expedition.montantTTC,
          'nombre': expedition.nombre,
          'poids': expedition.poids,
          'typeMarchandise': expedition.typeMarchandise,
          'valeurDeclaree': expedition.valeurDeclaree,
          'fraisHTperColis': expedition.fraisHTperColis,
          'fraisHTTotal': expedition.fraisHTTotal, //retours fonds
          'nombreBonsLivraison': expedition.nombreBonsLivraison,
          'banqueId': expedition.banqueId,
          'dEnvoi': expedition.dEnvoi,
          'montant': expedition.montant,
          'observation': expedition.observation,
          'serie': expedition.serie,
          'type': expedition.type,
        }),
      );
      final newExpedition = Expedition(
        nomExpediteur: expedition.nomExpediteur,
        telExpediteur: expedition.telExpediteur,
        nomDestinataire: expedition.nomDestinataire,
        telDestinataire: expedition.telDestinataire,
        codeABarre: expedition.codeABarre,
        codeExpedition: json.decode(response.body)['name'],
        codeGenere: expedition.codeGenere,
        dCloturation: expedition.dCloturation,
        dLivraison: expedition.dLivraison,
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
        //reglement
        typeTaxation: expedition.typeTaxation,
        montantHT: expedition.montantHT,
        montantTVA: expedition.montantTVA,
        montantTTC: expedition.montantTTC,
        nombre: expedition.nombre,
        poids: expedition.poids,
        typeMarchandise: expedition.typeMarchandise,
        valeurDeclaree: expedition.valeurDeclaree,
        fraisHTperColis: expedition.fraisHTperColis,
        fraisHTTotal: expedition.fraisHTTotal,
        //retours fonds
        nombreBonsLivraison: expedition.nombreBonsLivraison,
        banqueId: expedition.banqueId,
        dEnvoi: expedition.dEnvoi,
        montant: expedition.montant,
        observation: expedition.observation,
        serie: expedition.serie,
        type: expedition.type,
      );
      print(newExpedition.nomDestinataire);
      _items.add(newExpedition);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> deleteExpedition(String codeExpedition) async {
    final url = Uri.https(
      'pfe-trancentum-flutter-app-default-rtdb.firebaseio.com',
      '/expeditions/$codeExpedition.json',
      {
        'auth': authToken,
      },
    );
    final existingExpeditionIndex = _items.indexWhere(
        (expedition) => expedition.codeExpedition == codeExpedition);
    var existingExpedition = _items[existingExpeditionIndex];
    print("Index of product to delete --------------" +
        existingExpeditionIndex.toString());
    _items.removeAt(existingExpeditionIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingExpeditionIndex, existingExpedition);
      notifyListeners();
      print("STATUS CODE > 400" + response.body.toString());
      throw HttpException('Could not delete product.');
    }
    print("STATUS CODE < 400" + response.body.toString());
    existingExpedition = null;
  }
}
