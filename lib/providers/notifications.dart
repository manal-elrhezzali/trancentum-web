import 'package:flutter/material.dart';

class Notification {
  String id;
  String expeditionId;
  Notification({
    @required expeditionId,
    id,
  });
}

class Notifications with ChangeNotifier{
  List<Notification> _items = [
    Notification(id: "N1", expeditionId: "123456"),
    Notification(id: "N2", expeditionId: "223456"),
  ];
  List<Notification> get items {
    return [..._items];
  }
  int get itemCount {
    return _items.length;
  }
  // Notification findById(String notificationId) {
  //   return _items.firstWhere(
  //       (notification) => notification.id == notificationId,
  //       orElse: () => null);
  // }
  void removeItem(String notificationId) {
    _items.remove(notificationId);
    notifyListeners();
  }

}
