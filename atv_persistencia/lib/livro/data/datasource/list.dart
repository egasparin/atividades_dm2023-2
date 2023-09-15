import '../model/livro.dart';
import '../../../core/database/database_sqlflite.dart';

class LivroListDataSource {
  Future<List<LivroModel>> getAll() async {
    final db = await DatabaseSqflite.openDb();
    final List<Map<String, dynamic>> maps = await db.query(livrosTableName);
    return List.generate(maps.length, (i) {
      return LivroModel.fromJson(maps[i]);
    });
  }
}
