import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ListaEntity extends Equatable {
  late int? listaId;
  final String nome;
  final String descricao;

  ListaEntity({
    this.listaId,
    required this.nome,
    required this.descricao,
  });

  @override
  List<Object?> get props => [listaId];
}
