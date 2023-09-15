// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivroModel _$LivroModelFromJson(Map<String, dynamic> json) => LivroModel(
      livroId: json['livroId'] as int?,
      titulo: json['titulo'] as String,
      autor: json['autor'] as String,
      genero: json['genero'] as String,
      avaliacao: (json['avaliacao'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LivroModelToJson(LivroModel instance) =>
    <String, dynamic>{
      'livroId': instance.livroId,
      'titulo': instance.titulo,
      'autor': instance.autor,
      'genero': instance.genero,
      'avaliacao': instance.avaliacao,
    };
