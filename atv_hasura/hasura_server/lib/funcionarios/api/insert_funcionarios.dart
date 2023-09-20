import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> insertFuncionario(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final nome = request.url.queryParameters['nome'] ?? '';

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation CreateFuncionario(\$nome: String!) {
        insert_funcionarios(objects: { nome: \$nome}) {
          affected_rows
        }
      }
      ''', variables: {'nome': nome});

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
