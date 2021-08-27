import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/marchandise.dart';

class Marchandises with ChangeNotifier {
  List<Marchandise> _items = [
    Marchandise(id: "M1", type: "Marchandise1"),
    Marchandise(id: "M2", type: "Marchandise2"),

  ];
  List<Marchandise> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }
  Marchandise findById(String marchandiseId) {
    return _items.firstWhere(
        (marchandise) => marchandise.id == marchandiseId,
        orElse: () => null);
  }

}