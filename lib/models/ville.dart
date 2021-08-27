import 'package:flutter/foundation.dart';

class Ville {
  String id;
  String code;
  String nom;

  Ville({
    @required nom,
    @required id,
    code = "",
  });
}
