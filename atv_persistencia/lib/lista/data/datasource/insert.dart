import '../../../livro/data/model/livro.dart';
import '../model/lista.dart';
import '../../../core/database/database_sqlflite.dart';

class ListaInsertDataSource {
  Future<int> insert({required ListaModel lista}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      listasTableName,
      lista.toJson(),
    );
  }
}

class ListaLivrosRelacaoInsertDataSource {
  Future<void> insert(
      {required ListaModel lista, required LivroModel livro}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.execute('''
      INSERT INTO $relacaoTableName
      VALUES (${lista.listaId}, ${livro.livroId}, "${livro.titulo}", "${livro.autor}", "${livro.genero}", ${livro.avaliacao});
      ''');
  }
}
