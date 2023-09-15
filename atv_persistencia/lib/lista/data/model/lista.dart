// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/lista/domain/lista.dart';

part 'lista.g.dart';

@JsonSerializable()
class ListaModel extends ListaEntity {
  ListaModel({
    super.listaId,
    required super.nome,
    required super.descricao,
  });

  factory ListaModel.fromJson(Map<String, dynamic> json) =>
      _$ListaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListaModelToJson(this);
}
