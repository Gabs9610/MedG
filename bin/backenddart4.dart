import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/paciente_api.dart';
import 'api/usuario_api.dart';
import 'infra/custom_server.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/middleware_interception.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  final _di = Injects.initialize();

  var cascadeHandler = Cascade()
      .add(_di<LoginApi>().getHandler())
      .add(_di<PacientesApi>().getHandler(isSecurity: true))
      .add(_di<UsuarioApi>().getHandler(isSecurity: true))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MInterception.contentTypeJson)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
