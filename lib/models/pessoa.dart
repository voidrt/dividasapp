import 'package:dividas/models/transacao.dart';

class Pessoa {
  Pessoa(this.divida, this.transacoes);

  final int divida;
  final List<Transacao> transacoes;
}
