import '../../../core/database/database_sqlflite.dart';

class LivroDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      listasTableName,
      where: 'listaId = ?',
      whereArgs: [id],
    );
  }
}
