import 'dart:io';

import 'package:hasura_server/app_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  HttpOverrides.global = MyHttpOverrides();

  final hasuraServerURL = 'https://192.140.53.145:8080/v1/graphql';
  final handler = const Pipeline().addHandler(
    Modular(
      module: AppModule(
        hasuraServerURL: hasuraServerURL,
        hasuraGraphQLAdminSecret: 'myadminsecretkey',
      ),
    ),
  );

  final restServer = await io.serve(
    handler,
    '0.0.0.0',
    8085,
  );

  print(
    'Server online: ${restServer.address.host} '
    '${restServer.address.address}:${restServer.port}',
  );
}
