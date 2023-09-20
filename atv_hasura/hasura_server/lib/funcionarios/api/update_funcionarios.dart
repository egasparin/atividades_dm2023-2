import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> updateFuncionario(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final funcionarioId =
      int.parse(request.url.queryParameters['funcionarioId'] ?? '');
  final nome = request.url.queryParameters['nome'] ?? '';

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation UpdateFuncionario(\$funcionarioId: Int!, \$nome: String!) {
        update_funcionarios(where: { funcionarioId: {_eq: \$funcionarioId} }, _set: { nome: \$nome}) {
          affected_rows
        }
      }
      ''', variables: {
    'funcionarioId': funcionarioId,
    'nome': nome,
  });

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
