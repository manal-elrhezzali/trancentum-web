
// class RetoursDeFonds with ChangeNotifier {
//   List<RetourFonds> _items = [];
//   final String expeditionId;

//   RetoursDeFonds(this.expeditionId);

//   List<RetourFonds> get items {
//     return [..._items];
//   }

//   void addRetourFonds(RetourFonds retourDeFonds) {
//     final newRetourDeFonds = RetourFonds(
//       montant: retourDeFonds.montant,
//       codeExpedition: expeditionId,
//       nombre: retourDeFonds.nombre,
//       dCreation: retourDeFonds.dCreation,
//       type: retourDeFonds.type,
//     );
//     _items.add(newRetourDeFonds);
//     // _items.insert(0, newProduct); // at the start of the list
//     notifyListeners();
//   }

//   RetourFonds findById(String codeExpedition) {
//     return _items.firstWhere(
//         (retourFonds) => retourFonds.codeExpedition == codeExpedition,
//         orElse: () => null);
//   }
// }
