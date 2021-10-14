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

class Expedition {
  String telExpediteur;
  String nomExpediteur;
  String telDestinataire;
  String nomDestinataire;
  // String clientDestinataireId;
  // String clientExpediteurId;
  String codeABarre;
  String codeExpedition; //id
  String codeGenere;
  String dCloturation;
  String dLivraison;
  DateTime dcreation;
  String etat;
  String modePaiement;
  double nbrColis;
  double nbrFactures;
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
  //reglement 
  String typeTaxation;
  String montantHT;
  String montantTVA;
  String montantTTC;
  String nombre;
  String poids;
  String typeMarchandise;
  String valeurDeclaree;
  String fraisHTperColis;
  String fraisHTTotal;
  String fraisTTCperColis;
  String fraisTTCTotal;
  //retours de fonds
  String banqueId;
  String dEnvoi;
  double montant;
  int nombreBonsLivraison;
  String observation;
  String serie;
  String type;

  Expedition({
    @required nomExpediteur,
    @required telExpediteur,
    @required nomDestinataire,
    @required telDestinataire,
    this.codeABarre = "",
    @required this.codeExpedition,
    this.codeGenere = "",
    this.dCloturation = "",
    this.dLivraison = "",
    @required this.dcreation,
    this.etat = "Brouillon",
    @required this.modePaiement,
    @required this.nbrColis,
    @required this.nbrFactures,
    this.pht = 0.0,
    this.premise = 0.0,
    this.ptaxe1 = 0.0,
    this.ptaxe2 = 0.0,
    this.ptaxe3 = 0.0,
    this.ptaxe4 = 0.0,
    this.pttc = 0.0,
    this.ptva = 0.0,
    @required this.taxation,
    this.ttlPoids = 0.0,
    this.ttlValDeclaree = 0.0,
    @required this.typeLivraison,
    @required this.villeDestinataireId,
    @required this.villeExpediteurId,
    //reglement 
    @required this.typeTaxation,
    this.montantHT = "",
    this.montantTVA = "",
    this.montantTTC = "",
    @required this.nombre,
    this.poids = "",
    @required this.typeMarchandise,
    this.valeurDeclaree = "",
    this.fraisHTperColis = "",
    this.fraisHTTotal = "",
    this.fraisTTCperColis = "",
    this.fraisTTCTotal = "",
    //retours de fonds
    this.banqueId = "",
    @required nombreBonsLivraison,
    this.dEnvoi = "",
    @required this.montant,
    // @required this.nombre,
    this.observation = "",
    this.serie = "",
    @required this.type,
  });
}
