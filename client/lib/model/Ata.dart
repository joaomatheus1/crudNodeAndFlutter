import 'package:client/model/Colaborador.dart';
import 'package:client/model/Workshop.dart';

class Ata {
  int id;
  Workshop workshop;
  List<Colaborador> colaboradores;

  Ata(this.id,this.workshop, this.colaboradores);
}