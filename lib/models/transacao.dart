class Transacao {
  Transacao({
    required this.data,
    required this.valor,
    required this.titulo,
    this.descricao = '',
  });
  final DateTime data;
  final double valor;
  final String titulo;
  final String? descricao;

  @override
  String toString() =>
      "{'data': ${data.day}/${data.month}, 'valor': $valor, 'titulo': $titulo, 'descricao': $descricao}";
}
