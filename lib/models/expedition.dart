import 'package:flutter/material.dart';

// enum Etat {
//   Enregistree,
//   Chargee,
//   Recue,
//   Livree,
//   Retour,
//   Cloturee,
//   Brouillon,
// }

// enum TypeTaxation {
//   Forfait,
//   Taxation,
//   Service,
// }

// enum ModePaiement { PP, PPE, PD, PDE,}

class Expedition{
  String clientDestinataireId;
  String clientExpediteurId;
  String codeABarre;
  String codeExpedition;
  String codeGenere;
  DateTime dCloturation;
  DateTime dLivraison;
  DateTime dcreation;
  String etat;
  String modePaiement;
  int nbrColis;
  int nbrFactures;
  num pht;
  double premise;
  double ptaxe1;
  double ptaxe2;
  double ptaxe3;
  double ptaxe4;
  double pttc;
  double ptva;
  String taxation;
  double ttlPoids;
  double ttlValDeclaree;
  String typeLivraison;
  String villeDestinataireId;
  String villeExpediteurId;

  Expedition({
    @required this.clientDestinataireId,
    @required this.clientExpediteurId,
    this.codeABarre = "",
    @required this.codeExpedition,
    this.codeGenere = "",
    this.dCloturation,
    this.dLivraison,
    @required this.dcreation,
    this.etat = "Brouillon",
    @required this.modePaiement,
    @required this.nbrColis,
    @required this.nbrFactures,
    this.pht = 0,
    this.premise = 0,
    this.ptaxe1 = 0,
    this.ptaxe2 = 0,
    this.ptaxe3 = 0,
    this.ptaxe4 = 0,
    this.pttc = 0,
    this.ptva = 0,
    @required this.taxation,
    this.ttlPoids = 0,
    this.ttlValDeclaree = 0,
    @required this.typeLivraison,
    @required this.villeDestinataireId,
    @required this.villeExpediteurId,
  });

}