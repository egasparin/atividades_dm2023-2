import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> deleteFuncionario(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final funcionarioId =
      int.parse(request.url.queryParameters['funcionarioId'] ?? '');

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation DeleteFuncionario(\$funcionarioId: Int!) {
        delete_funcionarios(where: { funcionarioId: {_eq: \$funcionarioId} }) {
          affected_rows
        }
      }
      ''', variables: {'funcionarioId': funcionarioId});

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
