import '../../../core/database/database_sqlflite.dart';

class ListaDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.delete(
      livrosTableName,
      where: 'livroId = ?',
      whereArgs: [id],
    );
  }
}
