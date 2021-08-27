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

List<Reglement> demoReglements = [
  Reglement(
    modePaiement: "PPE",
    typeTaxation: "taxation",
    montantHT: "242077.85 DH",
    montantTVA: "33890.90 DH",
    montantTTC: "275968.75 DH",
    nombre: "9858",
    poids: "28",
    type: "marchandise 2",
    valeurDeclaree: "68458558.00",
    fraisHTperColis: "15.79",
    fraisHTTotal: "155652.63",
    fraisTTCperColis: "18.00",
    fraisTTCTotal: "177444.00",
  ),
];


