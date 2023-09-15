import '../../../core/database/database_sqlflite.dart';
import '../model/livro.dart';

class LivroUpdateDataSource {
  Future<int> update({required LivroModel livro}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      livrosTableName,
      livro.toJson(),
      where: 'livroId = ?',
      whereArgs: [livro.livroId],
    );
  }
}
