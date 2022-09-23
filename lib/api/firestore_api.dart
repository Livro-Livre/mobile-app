import 'package:cloud_firestore/cloud_firestore.dart';

// Classe e metódos responsáveis pela integração
// Flutter com os dados do banco de dados do Firebase Cloud Firestore.
class FirestoreApi {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Adiciona livro (item) vindo da
  // requisição do koha ao banco de dados do Firebase
  void addToBorrows(item) {
    db.collection('emprestimos').add({
      "date": DateTime.now(),
      "id": item.itemId,
      "isReturned": false,
      "name": "",
      "phone": "",
    });
  }

  // Troca o booleano de retorno do livro (isReturned)
  // de false para true.
  void markAsReturned2(item) {
    CollectionReference<Map<String, dynamic>> emprestimos =
        db.collection('emprestimos');
    //var emprestimos = db.collection('emprestimos');

    Query<Map<String, dynamic>> returningItem =
        emprestimos.where("id", isEqualTo: item.itemId);
    //var returningItem = emprestimos.where("id" == item.itemId);
  }

  void markAsReturned(item) async {
    try {
      final post = await db
          .collection('emprestimos')
          .where('id', isEqualTo: item.itemId)
          .get()
          .then((QuerySnapshot snapshot) {
        //Here we get the document reference and return to the post variable.
        return snapshot.docs;
      });

      for (var element in post) {
        var batch = db.batch();
        //Updates the field value, using post as document reference
        batch.update(element.reference, {'isReturned': true});
        batch.commit();
      }
    } catch (e) {
      print(e);
    }
  }
}
