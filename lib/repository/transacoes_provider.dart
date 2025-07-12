import 'package:dividas/models/transacao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, List<Transacao>>(
      (ref) => TransactionNotifier(),
    );

class TransactionNotifier extends StateNotifier<List<Transacao>> {
  TransactionNotifier() : super([]);

  double sumAllTransactions() {
    double result = 0;
    for (Transacao transacao in state) {
      result += transacao.valor;
    }
    return result;
  }

  void add(
    String titulo,
    String? descricao,
    DateTime data,
    double valor,
  ) async {
    state = [
      Transacao(data: data, titulo: titulo, valor: valor, descricao: descricao),
      ...state,
    ];
  }

  void remove(Transacao transacao) async {
    state = [...state.where((transicao) => transicao != transacao)];
  }
}
