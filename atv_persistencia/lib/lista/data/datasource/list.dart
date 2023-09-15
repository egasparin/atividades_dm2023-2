import '../../../livro/data/model/livro.dart';
import '../model/lista.dart';
import '../../../core/database/database_sqlflite.dart';

class ListaListDataSource {
  Future<List<ListaModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps = await db.query(listasTableName);
    return List.generate(maps.length, (i) {
      return ListaModel.fromJson(maps[i]);
    });
  }
}

class ListaLivrosRelacaoDataSource {
  Future<List<LivroModel>> get({
    required ListaModel lista,
  }) async {
    final db = await DatabaseSqflite.openDb();

    final List<Map<String, dynamic>> maps = await db.query(
      relacaoTableName,
      columns: ['livroId', 'titulo', 'autor', 'genero'],
      where: 'listaId = ?',
      whereArgs: [lista.listaId],
    );

    return List.generate(maps.length, (i) {
      return LivroModel.fromJson(maps[i]);
    });
  }
}
