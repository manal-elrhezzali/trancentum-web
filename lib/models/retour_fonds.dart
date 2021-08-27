import 'package:flutter/foundation.dart';


// enum TypeRetourFonds {
//   Remboursement,
//       Cheque,
//       Traite,
//       BL,
// }
class RetourFonds {
  String banqueId;
  String dCreation;
  String dEnvoi;
  String etat;
  String codeExpedition;
  double montant;
  int nombre;
  String observation;
  String serie;
  String type;

  RetourFonds({
  @required this.banqueId,
  @required this.dCreation,
  @required this.dEnvoi,
  @required this.etat,
  @required this.codeExpedition,
  @required this.montant,
  @required this.nombre,
  @required this.observation,
  @required this.serie,
  @required this.type,
  });
}