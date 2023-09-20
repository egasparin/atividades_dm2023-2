import 'package:shelf_modular/shelf_modular.dart';

import 'api/delete_funcionarios.dart';
import 'api/get_all_funcionarios.dart';
import 'api/insert_funcionarios.dart';
import 'api/update_funcionarios.dart';

class FuncionariosResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/funcionarios', getAllFuncionarios),
        Route.get('/funcionarios', insertFuncionario),
        Route.get('/funcionarios', updateFuncionario),
        Route.get('/funcionarios', deleteFuncionario),
      ];
}
