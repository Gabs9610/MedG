import '../infra/database/db_configuration.dart';
import '../models/usuario_model.dart';
import 'dao.dart';

class UsuarioDAO implements DAO<UsuarioModel> {
  final DBConfiguration _dbConfiguration;
  UsuarioDAO(this._dbConfiguration);

  @override
  Future<bool> create(UsuarioModel value) async {
    var result = await _dbConfiguration.execQuery(
      'INSERT INTO MedG.usuarios (nome, email, passaword) VALUES (?, ?, ?)',
      [value.nome, value.user, value.email, value.password],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration.execQuery(
      'DELETE from MEDG.usuarios where id = ?',
      [id],
    );
    return result.affectedRows > 0;
    ;
  }

  @override
  Future<List<UsuarioModel>> findAll() async {
    var result =
        await _dbConfiguration.execQuery('SELECT * FROM MedG.usuarios');
    return result
        .map((r) => UsuarioModel.fromMap(r.fields))
        .toList()
        .cast<UsuarioModel>();
  }

  @override
  Future<UsuarioModel?> findOne(int id) async {
    var result = await _dbConfiguration.execQuery(
      'SELECT * FROM MedG.usuarios where id = ?',
      [id],
    );
    return result.affectedRows == 0
        ? null
        : UsuarioModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(UsuarioModel value) async {
    var result = await _dbConfiguration.execQuery(
      'UPDATE MedG.usuarios set nome = ?, password = ?, id = ?',
      [value.nome, value.user, value.password, value.id],
    );
    return result.affectedRows > 0;
  }

  Future<UsuarioModel?> findByUser(String user) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM MedG.usuarios where user = ?', [user]);
    return result.affectedRows == 0
        ? null
        : UsuarioModel.fromUser(result.first.fields);
  }
}
