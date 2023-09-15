import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LivroEntity extends Equatable {
  late int? livroId;
  final String titulo;
  final String autor;
  final String genero;
  late double? avaliacao;

  LivroEntity({
    this.livroId,
    required this.titulo,
    required this.autor,
    required this.genero,
    this.avaliacao
  });

  @override
  List<Object?> get props => [livroId];
}
