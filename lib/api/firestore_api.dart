import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  addToBorrows(item) {
    db.collection('emprestimos').add({
      "date": DateTime.now(),
      "id": item.itemId,
      "isReturned": false,
      "name": "",
      "phone": "",
    });
  }
}
