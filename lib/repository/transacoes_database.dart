import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dividas/models/transacao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageProvider = Provider<Storage>(
  (ref) => Storage(firestore: FirebaseFirestore.instance),
);

class Storage {
  Storage({required this.firestore});

  final FirebaseFirestore firestore;

  Future<List<Transacao>> getTransactions() async {
    final transactions = await firestore.collection('dividas').get();

    return transactions.docs.isEmpty
        ? []
        : transactions.docs
              .map((transacao) => Transacao.fromJson(transacao.data()))
              .toList();
  }

  void saveTransactionToStorage(Transacao transaction) async {
    await firestore
        .collection("dividas")
        .doc(
          "${transaction.titulo}${transaction.data.toDate().day}${transaction.data.toDate().month}",
        )
        .set(transaction.toJson());
  }

  void removeTransactionFromStorage(Transacao transacao) async {
    await firestore
        .collection('dividas')
        .doc(
          "${transacao.titulo}${transacao.data.toDate().day}${transacao.data.toDate().month}",
        )
        .delete();
  }
}
