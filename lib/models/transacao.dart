import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class Transacao {
  Transacao({
    required this.data,
    this.descricao = '',
    required this.titulo,
    required this.valor,
  });
  final Timestamp data;
  final String? descricao;
  final String titulo;
  final double valor;

  Transacao.fromJson(Map<String, dynamic> json)
    : this(
        data: json['data']! as Timestamp,
        descricao: json['descricao']! as String,
        titulo: json['titulo']! as String,
        valor: json['valor']! as double,
      );

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'descricao': descricao,
      'titulo': titulo,
      'valor': valor,
    };
  }
}
