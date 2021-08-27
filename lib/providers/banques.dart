import 'package:flutter/foundation.dart';
import 'package:trancentum_web_app/models/banque.dart';

class Banques with ChangeNotifier {
  List<Banque> _items = [
    Banque(id: "B1", nom: "Chaabi", code: "CHA1234"),
    Banque(id: "B2", nom: "BMCE", code: "BM98645"),
  ];
  List<Banque> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  Banque findById(String banqueId) {
    return _items.firstWhere((banque) => banque.id == banqueId,
        orElse: () => null);
  }
}
