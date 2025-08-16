import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dividas/models/base/base_view_model.dart';
import 'package:dividas/models/transacao.dart';
import 'package:dividas/repository/transacoes_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HomeViewModelStatus { loading, success, error }

class HomeState extends BaseState {
  HomeState({
    this.transactions = const [],
    this.dividaTotal = 0,
    super.isLoading,
    super.errorMessage,
  });
  final List<Transacao> transactions;
  final double dividaTotal;
  @override
  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    double? dividaTotal,
    List<Transacao>? newTransactions,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      transactions: newTransactions ?? transactions,
      dividaTotal: dividaTotal ?? this.dividaTotal,
    );
  }

  static HomeState empty() => HomeState();
}

class HomeViewModel extends BaseViewModel<HomeState> {
  final Ref _ref;
  final Storage _storage;

  HomeViewModel({required Storage storage, required Ref ref})
    : _storage = storage,
      _ref = ref,
      super(HomeState.empty()) {
    _load();
  }

  void _load() async {
    setLoading(true);
    try {
      final transactions = await _storage.getTransactions();
      final double valorTotal = transactions.fold(
        0,
        (previous, next) => previous + next.valor,
      );
      state = state.copyWith(
        isLoading: false,
        newTransactions: transactions,
        dividaTotal: valorTotal,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Ocorreu um erro: ${e.toString()}',
      );
    }
  }

  void addTransaction(
    Timestamp data,
    String descricao,
    String titulo,
    String valor,
  ) async {
    final transaction = Transacao(
      data: data,
      titulo: titulo,
      valor: double.parse(valor),
    );

    _storage.saveTransactionToStorage(transaction);
    _load();
  }

  void delete(Transacao transacao) {
    _storage.removeTransactionFromStorage(transacao);
    _load();
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((
  ref,
) {
  return HomeViewModel(ref: ref, storage: ref.watch(storageProvider));
});
