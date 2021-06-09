import 'package:flutter/material.dart';

class Reglement {
  final String modePaiement,
      typeTaxation,
      montantHT,
      montantTVA,
      montantTTC,
      nombre,
      poids,
      type,
      valeurDeclaree,
      fraisHTperColis,
      fraisHTTotal,
      fraisTTCperColis,
      fraisTTCTotal;

  Reglement({
    @required this.modePaiement,
    @required this.typeTaxation,
    @required this.montantHT,
    @required this.montantTVA,
    @required this.montantTTC,
    @required this.nombre,
    @required this.poids,
    @required this.type,
    @required this.valeurDeclaree,
    @required this.fraisHTperColis,
    @required this.fraisHTTotal,
    @required this.fraisTTCperColis,
    @required this.fraisTTCTotal,
  });
}


