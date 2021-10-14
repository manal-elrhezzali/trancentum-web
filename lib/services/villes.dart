import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/ville.dart';

class Villes with ChangeNotifier {
  List<Ville> _items = [
    Ville(nom: "FES", id: "c1"),
    Ville(nom: "Meknes", id: "c2"),
    Ville(nom: "Rabat", id: "c3"),
    Ville(nom: "Tanger", id: "c4"),
  ];

  List<Ville> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  Ville findById(String villeId) {
    return _items.firstWhere((ville) => ville.id == villeId,
        orElse: () => null);
  }
}
