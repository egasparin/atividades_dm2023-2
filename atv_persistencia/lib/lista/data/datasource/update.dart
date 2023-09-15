import '../../../core/database/database_sqlflite.dart';
import '../model/lista.dart';

class ListaUpdateDataSource {
  Future<int> update({required ListaModel lista}) async {
    final db = await DatabaseSqflite.openDb();
    return await db.update(
      listasTableName,
      lista.toJson(),
      where: 'listaId = ?',
      whereArgs: [lista.listaId],
    );
  }
}

