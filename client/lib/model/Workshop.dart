import 'package:client/model/Colaborador.dart';

class Workshop {
  int id;
  String nome;
  DateTime dataRealizacao;
  String descricao;
  Colaborador colaborador;

  Workshop(this.id, this.nome, this.dataRealizacao, this.descricao, this.colaborador);
}