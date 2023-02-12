import '../../api/login_api.dart';
import '../../api/paciente_api.dart';
import '../../api/usuario_api.dart';
import '../../dao/paciente_dao.dart';
import '../../dao/usuario_dao.dart';
import '../../models/paciente_model.dart';
import '../../services/generic_service.dart';
import '../../services/login_service.dart';
import '../../services/paciente_service.dart';
import '../../services/usuario_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuratin.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DBConfiguration>(() => MySqlDBConfiguration());

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<PacienteDAO>(() => PacienteDAO(di<DBConfiguration>()));
    di.register<GenericService<PacienteModel>>(
        () => PacienteService(di<PacienteDAO>()));
    di.register<PacientesApi>(
        () => PacientesApi(di<GenericService<PacienteModel>>()));

    di.register<UsuarioDAO>(() => UsuarioDAO(di<DBConfiguration>()));
    di.register<UsuarioService>(() => UsuarioService(di<UsuarioDAO>()));
    di.register<UsuarioApi>(() => UsuarioApi(di<UsuarioService>()));

    di.register<LoginService>(() => LoginService(di<UsuarioService>()));
    di.register<LoginApi>(
        () => LoginApi(di<SecurityService>(), di<LoginService>()));

    return di;
  }
}
