import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseState {
  final bool isLoading;
  final String? errorMessage;

  const BaseState({
    this.isLoading = false,
    this.errorMessage,
  });

  BaseState copyWith({
    bool? isLoading,
    String? errorMessage,
  });
}

abstract class BaseViewModel<T extends BaseState> extends StateNotifier<T> {
  BaseViewModel(super.initialState);

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading) as T;
  }

  void setError(String? error) {
    state = state.copyWith(errorMessage: error) as T;
  }
} 
