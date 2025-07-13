import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dividas/models/transacao.dart';
import 'package:dividas/repository/transacoes_database.dart';
import 'package:dividas/shared/standard_text.dart';
import 'package:dividas/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTransacao extends StatefulWidget {
  const AddTransacao({super.key, required this.ref});

  final WidgetRef ref;

  @override
  State<AddTransacao> createState() => _AddTransacaoState();
}

class _AddTransacaoState extends State<AddTransacao> {
  @override
  void dispose() {
    titulo.dispose();
    valor.dispose();
    descricao.dispose();
    super.dispose();
  }

  final TextEditingController titulo = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: StandardBodyText('Nova dívida do bobo'),
      actions: [
        TextButton(
          onPressed: () {
            Storage().saveTransactionToStorage(
              Transacao(
                data: Timestamp.now(),
                descricao: descricao.text,
                titulo: titulo.text,
                valor: double.parse(valor.text),
              ),
            );

            Navigator.pop(context);
          },
          child: StandardBodyText('Adicionar dívida'),
        ),
      ],
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: titulo,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hint: StandardSubtitleText('Título'),
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.lightGrey),
              ),
            ),
            TextField(
              controller: valor,
              style: Theme.of(context).textTheme.bodyMedium,

              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hint: StandardSubtitleText('Valor')),
            ),
            TextField(
              controller: descricao,
              style: Theme.of(context).textTheme.bodyMedium,

              decoration: InputDecoration(
                hint: StandardSubtitleText('Descrição'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
