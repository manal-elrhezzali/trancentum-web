
// class Reglements with ChangeNotifier {
//   List<Reglement> _items = [];
//   final String expeditionId;

//   Reglements(this.expeditionId);

//   List<Reglement> get items {
//     return [..._items];
//   }

//   void addRetourFonds(Reglement reglement) {
//     final newReglement = Reglement(
//       nombre: reglement.nombre,
//       codeExpedition:  expeditionId,
//       typeMarchandise: reglement.typeMarchandise,
//       typeTaxation: reglement.typeTaxation,
//     );
//     _items.add(newReglement);
//     // _items.insert(0, newProduct); // at the start of the list
//     notifyListeners();
//   }

//   Reglement findById(String codeExpedition) {
//     return _items.firstWhere(
//         (reglement) => reglement.codeExpedition == codeExpedition,
//         orElse: () => null);
//   }
// }
