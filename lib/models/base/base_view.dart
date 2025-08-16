import 'package:dividas/models/base/base_view_model.dart'
    show BaseViewModel, BaseState;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView<T extends BaseViewModel<S>, S extends BaseState>
    extends ConsumerWidget {
  final Widget Function(BuildContext context, S state, T viewModel) builder;
  final StateNotifierProvider<T, S> provider;

  const BaseView({super.key, required this.builder, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(provider.notifier);
    final state = ref.watch(provider);

    return builder(context, state, viewModel);
  }
}
