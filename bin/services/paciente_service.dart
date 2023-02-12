import '../dao/paciente_dao.dart';
import '../models/paciente_model.dart';
import 'generic_service.dart';

class PacienteService implements GenericService<PacienteModel> {
  final PacienteDAO _pacienteDAO;
  PacienteService(this._pacienteDAO);

  @override
  Future<bool> delete(int id) {
    return _pacienteDAO.delete(id);
  }

  @override
  Future<List<PacienteModel>> findAll() {
    return _pacienteDAO.findAll();
  }

  @override
  Future<PacienteModel?> findOne(int id) {
    return _pacienteDAO.findOne(id);
  }

  @override
  Future<bool> save(PacienteModel value) {
    if (value.id != null) {
      return _pacienteDAO.update(value);
    } else {
      return _pacienteDAO.create(value);
    }
  }
}
