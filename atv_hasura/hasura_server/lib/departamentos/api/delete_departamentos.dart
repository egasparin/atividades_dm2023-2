import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> deleteDepartamento(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();


  final departamentoId =
      int.parse(request.url.queryParameters['departamentoId'] ?? '');

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation DeleteDepartamento(\$departamentoId: Int!) {
        delete_funcionarios(where: { departamentoId: {_eq: \$departamentoId} }) {
          affected_rows
        }
      }
      ''', variables: {'departamentoId': departamentoId});

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
