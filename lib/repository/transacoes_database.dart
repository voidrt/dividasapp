import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dividas/models/transacao.dart';

class Storage {
  Storage() {
    _reference = _firestore
        .collection('dividas')
        .withConverter<Transacao>(
          fromFirestore: (snapshots, _) {
            return Transacao.fromJson(snapshots.data()!);
          },
          toFirestore: (transacao, _) => transacao.toJson(),
        );
  }

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _reference;

  Stream<QuerySnapshot> getTransactions() {
    return _reference.snapshots();
  }

  void saveTransactionToStorage(Transacao transaction) async {
    _reference.add(transaction);
  }

  void removeTransactionFromStorage(
    QueryDocumentSnapshot<Object?> transacao,
  ) async {
    await _firestore.runTransaction((Transaction process) async {
      process.delete(transacao.reference);
    });
  }
}
