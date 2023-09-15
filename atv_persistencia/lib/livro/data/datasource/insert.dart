import '../model/livro.dart';
import '../../../core/database/database_sqlflite.dart';

class LivroInsertDataSource {
  Future<int> insert({required LivroModel livro}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.insert(
      livrosTableName,
      livro.toJson(),
    );
  }
}