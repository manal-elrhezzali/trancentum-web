import 'package:flutter/material.dart';

class Expedition {
  final String livraison,
      agenceDepart,
      expediteur,
      destinataire,
      villeExpediteur,
      villeDestinataire,
      codeExpedition,
      date,
      etat,
      villeDepart,
      villeArrivee;

  Expedition({
    @required this.agenceDepart,
    @required this.expediteur,
    @required this.destinataire,
    @required this.villeExpediteur,
    @required this.villeDestinataire,
    @required this.villeDepart,
    @required this.villeArrivee,
    @required this.codeExpedition,
    @required this.date,
    @required this.etat,
    @required this.livraison,
  });
}

