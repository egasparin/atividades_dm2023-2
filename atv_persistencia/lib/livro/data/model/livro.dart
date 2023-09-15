// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/livro/domain/livro.dart';

part 'livro.g.dart';

@JsonSerializable()
class LivroModel extends LivroEntity {
  LivroModel({
    super.livroId,
    required super.titulo,
    required super.autor,
    required super.genero,
    super.avaliacao,
  });

  factory LivroModel.fromJson(Map<String, dynamic> json) =>
      _$LivroModelFromJson(json);

  Map<String, dynamic> toJson() => _$LivroModelToJson(this);
}
