import 'package:dividas/models/pessoa.dart';
import 'package:dividas/models/transacao.dart';
import 'package:dividas/shared/standard_text.dart';
import 'package:dividas/theme/app_theme.dart';
import 'package:dividas/theme/colors.dart';
import 'package:dividas/theme/paddings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Pessoa? rojas = Pessoa(147, [
    Transacao(
      data: DateTime.now(),
      valor: 14.56,
      titulo: 'Teste um',
      descricao: 'compra do salgado sla',
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: DividasAppTheme.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dívidas do rojas"),
          backgroundColor: AppColors.primary,
          actions: [
            Text('Total em BRL:'),
            Text('${rojas?.divida}'),
            SizedBox(width: AppPaddings.defaultSize),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: AppPaddings.small),
            Text('Lista de dívidas (all time)'),
            Expanded(
              child: ListView.builder(
                itemCount: rojas?.transacoes.length,
                itemBuilder: (context, count) {
                  if (rojas?.transacoes == null) return null;
                  final Transacao transacao = rojas!.transacoes[count];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.defaultSize,
                      vertical: AppPaddings.small,
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPaddings.defaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StandardHeadlineText(transacao.titulo),
                              Row(
                                children: [
                                  StandardHeadlineText('Valor:  '),

                                  StandardHeadlineText(
                                    transacao.valor.toStringAsFixed(1),
                                    color: AppColors.green,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          StandardSubtitleText(
                            'Dia ${transacao.data.day}/${transacao.data.month}',
                          ),
                          SizedBox(height: AppPaddings.big),
                          StandardBodyText(transacao.descricao ?? ''),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
