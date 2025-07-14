import 'dart:developer';

import 'package:dividas/models/transacao.dart';
import 'package:dividas/repository/transacoes_database.dart';
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
  Widget build(BuildContext context) {
    var database = Storage();

    return StreamBuilder(
      stream: database.getTransactions(),
      builder: (context, snapshots) {
        List? transacoes = snapshots.data?.docs ?? [];
        double dividaTotal = 0;

        for (var element in transacoes) {
          dividaTotal += (element['valor']);
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.black,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StandardHeadlineText(
                  "Dívidas do bocó",
                  color: AppColors.backgroundWhite,
                ),
                Row(
                  children: [
                    StandardBodyText(
                      'Total em BRL: ',
                      color: AppColors.background,
                    ),
                    StandardBodyText(
                      'R\$',
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    StandardBodyText(
                      dividaTotal.toStringAsFixed(0),
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
            toolbarHeight: AppPaddings.superUltraBig * 1.5,
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
            child: Icon(Icons.add, size: 30),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppPaddings.medium),

              Expanded(
                child: ListView.builder(
                  itemCount: transacoes.length,
                  itemBuilder: (context, count) {
                    Transacao transacao = transacoes[count].data();

                    return TransactionCard(
                      tituloTransacao: transacao.titulo,
                      valorTransacao: transacao.valor.toStringAsFixed(1),
                      dataTransacao: transacao.data,
                      descricaoTransacao: transacao.descricao,
                      delete: () {
                        database.removeTransactionFromStorage(
                          transacoes[count],
                        );
                      },
                      edit: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
