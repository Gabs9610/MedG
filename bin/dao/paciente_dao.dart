import '../infra/database/db_configuration.dart';
import '../models/paciente_model.dart';
import 'dao.dart';

class PacienteDAO implements DAO<PacienteModel> {
  final DBConfiguration _dbConfiguration;
  PacienteDAO(this._dbConfiguration);

  @override
  Future<bool> create(PacienteModel value) async {
    var result = await _dbConfiguration.execQuery(
      'INSERT INTO MedG.pacientes (nome, cpf, cns, dt_de_nascimento, sexo, cor, nome_da_mae, nacionalidade, municipio_de_nascimento, telefone, telefone2, email, cep, endereco, numero, complemento, cidade, estado, estado_civil, ocupacao, id_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        value.nome,
        value.cpf,
        value.cns,
        value.dtNascimento,
        value.sexo,
        value.cor,
        value.nomeMae,
        value.nacionalidade,
        value.municipioNascimento,
        value.telefone,
        value.telefone2,
        value.email,
        value.cep,
        value.endereco,
        value.numero,
        value.complemento,
        value.cidade,
        value.estado,
        value.estadoCivil,
        value.ocupacao,
        value.idUsuario
      ],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration.execQuery(
      'DELETE from MEDG.pacientes where id = ?',
      [id],
    );
    return result.affectedRows > 0;
    ;
  }

  @override
  Future<List<PacienteModel>> findAll() async {
    var result =
        await _dbConfiguration.execQuery('SELECT * FROM MedG.pacientes');
    return result
        .map((r) => PacienteModel.fromMap(r.fields))
        .toList()
        .cast<PacienteModel>();
  }

  @override
  Future<PacienteModel?> findOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM MedG.pacientes where id = ?', [id]);
    return result.isEmpty ? null : PacienteModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(PacienteModel value) async {
    var result = await _dbConfiguration.execQuery(
      'UPDATE MedG.usuarios set nome = ?, cpf = ?, cns = ?, dt_de_nascimento = ?, sexo = ?, cor = ?, nome_da_mae = ?, nacionalidade = ?, municipio_de_nascimento = ?, telefone = ?, telefone2 = ?, email = ?, cep = ?, endereco = ?, numero = ?, complemento = ?, cidade = ?, estado = ?, estado_civil = ?, ocupacao = ?, id_usuario = ? where id = ?',
      [
        value.nome,
        value.cpf,
        value.cns,
        value.dtNascimento,
        value.sexo,
        value.cor,
        value.nomeMae,
        value.nacionalidade,
        value.municipioNascimento,
        value.telefone,
        value.telefone2,
        value.email,
        value.cep,
        value.endereco,
        value.numero,
        value.complemento,
        value.cidade,
        value.estado,
        value.estadoCivil,
        value.ocupacao,
        value.idUsuario,
        value.id
      ],
    );
    return result.affectedRows > 0;
  }
}
