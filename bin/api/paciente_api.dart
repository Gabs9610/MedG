import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/paciente_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class PacientesApi extends Api {
  final GenericService<PacienteModel> _service;
  PacientesApi(this._service);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    Router router = Router();

    router.get('/paciente', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);

      var paciente = await _service.findOne(int.parse(id));
      if (paciente == null) return Response(400);

      return Response.ok(jsonEncode(paciente.toJson()));
    });

    router.get('/pacientes', (Request req) async {
      List<PacienteModel> pacientes = await _service.findAll();
      List<Map> pacientesMap = pacientes.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(pacientesMap));
    });

    router.post('/pacientes', (Request req) async {
      var body = await req.readAsString();
      var result = await _service.save(
        PacienteModel.fromRequest(jsonDecode(body)),
      );
      return result ? Response(201) : Response(500);
    });

    router.put('/pacientes', (Request req) async {
      var body = await req.readAsString();
      var result = await _service.save(
        PacienteModel.fromRequest(jsonDecode(body)),
      );
      return result ? Response(200) : Response(500);
    });

    router.delete('/pacientes', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);

      var result = await _service.delete(int.parse(id));
      return result ? Response(200) : Response.internalServerError();
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
