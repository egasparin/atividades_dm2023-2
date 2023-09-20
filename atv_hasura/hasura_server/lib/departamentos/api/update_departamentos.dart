import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> updateDepartamento(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final departamentoID =
      int.parse(request.url.queryParameters['departamentoId'] ?? '');
  final nome = request.url.queryParameters['nome'] ?? '';

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation UpdateDepartamento(\$departamentoId: Int!, \$nome: String!) {
        update_funcionarios(where: { departamentoId: {_eq: \$departamentoId} }, _set: { nome: \$nome}) {
          affected_rows
        }
      }
      ''', variables: {
    'departamentoId': departamentoID,
    'nome': nome,
  });

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
