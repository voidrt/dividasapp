import 'package:dividas/models/transacao.dart';
import 'package:dividas/repository/transacoes_provider.dart';
import 'package:dividas/shared/standard_text.dart';
import 'package:dividas/theme/colors.dart';
import 'package:dividas/theme/paddings.dart';
import 'package:dividas/widgets/transacao_dialog.dart';
import 'package:dividas/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late double dividaTotal;
    final List<Transacao> transacoes = ref.watch(transactionProvider);

    dividaTotal = ref.watch(transactionProvider.notifier).sumAllTransactions();
    return Scaffold(
      appBar: AppBar(
        title: StandardBodyText("Dívidas do bocó"),
        actions: [
          Text('Total em BRL: '),
          Text(dividaTotal.toStringAsFixed(0)),
          SizedBox(width: AppPaddings.defaultSize),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTransacao(ref: ref);
            },
          );
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppPaddings.small),
          Padding(
            padding: const EdgeInsets.only(left: AppPaddings.defaultSize),
            child: StandardBodyText('Lista de dívidas:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (context, count) {
                final Transacao transacao = transacoes[count];

                return TransactionCard(
                  tituloTransacao: transacao.titulo,
                  valorTransacao: transacao.valor.toStringAsFixed(1),
                  dataTransacao: transacao.data,
                  descricaoTransacao: transacao.descricao,
                  delete: () =>
                      ref.read(transactionProvider.notifier).remove(transacao),
                  edit: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
