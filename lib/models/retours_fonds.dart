import 'package:flutter/material.dart';

class RetourFonds {
  final String codeExpedition,
      retourDeFonds,
      montant,
      nombre,
      banque,
      serie,
      observation,
      etat;

  RetourFonds({
    @required this.codeExpedition,
    @required this.retourDeFonds,
    @required this.montant,
    @required this.nombre,
    @required this.banque,
    @required this.serie,
    @required this.observation,
    @required this.etat,
  });

  
}
List<RetourFonds> demoRetoursDeFonds = [
    RetourFonds(
      codeExpedition: "56412",
      retourDeFonds: "C/Chèque",
      montant: "68458558",
      nombre: "65",
      banque: "",
      serie: "",
      observation: "",
      etat: "en attente",
    ),
    // RetourFonds(
    //   codeExpedition: "26412",
    //   retourDeFonds: "C/Chèque",
    //   montant: "68458558",
    //   nombre: "65",
    //   banque: "",
    //   serie: "",
    //   observation: "",
    //   etat: "en attente",
    // ),
    // RetourFonds(
    //   codeExpedition: "16412",
    //   retourDeFonds: "C/Chèque",
    //   montant: "68458558",
    //   nombre: "65",
    //   banque: "",
    //   serie: "",
    //   observation: "",
    //   etat: "en attente",
    // ),
  ];
