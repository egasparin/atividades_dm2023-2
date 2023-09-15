// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListaModel _$ListaModelFromJson(Map<String, dynamic> json) => ListaModel(
      listaId: json['listaId'] as int?,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$ListaModelToJson(ListaModel instance) =>
    <String, dynamic>{
      'listaId': instance.listaId,
      'nome': instance.nome,
      'descricao': instance.descricao,
    };
