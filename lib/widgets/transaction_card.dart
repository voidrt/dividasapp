import 'package:dividas/shared/standard_text.dart';
import 'package:dividas/theme/colors.dart';
import 'package:dividas/theme/paddings.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.tituloTransacao,
    required this.valorTransacao,
    required this.dataTransacao,
    this.descricaoTransacao = '',
    required this.delete,
    required this.edit,
  });

  final String tituloTransacao;
  final String valorTransacao;
  final DateTime dataTransacao;
  final String? descricaoTransacao;
  final VoidCallback delete;
  final VoidCallback edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: AppPaddings.defaultSize,
        vertical: AppPaddings.medium,
      ),
      height: MediaQuery.of(context).size.height / 6.5,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPaddings.defaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StandardHeadlineText(tituloTransacao),
                        Row(
                          children: [
                            StandardHeadlineText('Valor:  '),
                            StandardHeadlineText(
                              valorTransacao,
                              color: AppColors.green,
                            ),
                          ],
                        ),
                      ],
                    ),

                    StandardSubtitleText(
                      'Dia ${dataTransacao.day}/${dataTransacao.month}',
                    ),
                    SizedBox(height: AppPaddings.big),
                    StandardBodyText(descricaoTransacao ?? ''),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPaddings.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    edit();
                  },
                  child: Icon(Icons.edit, color: AppColors.background),
                ),
                GestureDetector(
                  onTap: () {
                    delete();
                  },
                  child: Icon(LineIcons.trash, color: AppColors.background),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
