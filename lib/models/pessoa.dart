import 'package:dividas/models/transacao.dart';

class Pessoa {
  Pessoa(this.dividaTotal, this.transacoes);

  final double dividaTotal;
  final List<Transacao> transacoes;
}
