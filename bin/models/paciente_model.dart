// ignore_for_file: public_member_api_docs, sort_constructors_first
class PacienteModel {
  int? id;
  String? nome;
  int? cpf;
  int? cns;
  DateTime? dtNascimento;
  String? sexo;
  String? cor;
  String? nomeMae;
  String? nacionalidade;
  String? municipioNascimento;
  int? telefone;
  int? telefone2;
  String? email;
  int? cep;
  String? endereco;
  int? numero;
  String? complemento;
  String? cidade;
  String? estado;
  String? estadoCivil;
  String? ocupacao;
  DateTime? dtCriacao;
  DateTime? dtAtualizacao;
  int? idUsuario;

  PacienteModel();

  factory PacienteModel.fromMap(Map map) {
    return PacienteModel()
      ..id = map['id']?.toInt()
      ..nome = map['nome']
      ..cpf = map['cpf']?.toInt()
      ..cns = map['cns']?.toInt()
      ..dtNascimento = map['dt_de_nascimento'].toDateTime()
      ..sexo = map['sexo']
      ..cor = map['cor']
      ..nomeMae = map['nome_da_mae']
      ..nacionalidade = map['nacionalidade']
      ..municipioNascimento = map['municipio_de_nascimento']
      ..telefone = map['telefone']?.toInt()
      ..telefone2 = map['telefone2']?.toInt()
      ..email = map['email']
      ..cep = map['cep']?.toInt()
      ..endereco = map['endereco']
      ..numero = map['numero']?.toInt()
      ..complemento = map['complemento']
      ..cidade = map['cidade']
      ..estado = map['estado']
      ..estadoCivil = map['estado_civil']
      ..ocupacao = map['ocupacao']
      ..dtCriacao = map['dt_criacao']
      ..dtAtualizacao = map['dt_atualizacao']
      ..idUsuario = map['id_usuario']?.toInt();
  }

  factory PacienteModel.fromRequest(Map map) {
    return PacienteModel()
      ..id = map['id']?.toInt()
      ..nome = map['nome']
      ..cpf = map['cpf']?.toInt()
      ..cns = map['cns']?.toInt()
      ..dtNascimento = map['dt_de_nascimento']
      ..sexo = map['sexo']
      ..cor = map['cor']
      ..nomeMae = map['nome_da_mae']
      ..nacionalidade = map['nacionalidade']
      ..municipioNascimento = map['municipio_de_nascimento']
      ..telefone = map['telefone']?.toInt()
      ..telefone2 = map['telefone2']?.toInt()
      ..email = map['email']
      ..cep = map['cep']?.toInt()
      ..endereco = map['endereco']
      ..numero = map['numero']?.toInt()
      ..complemento = map['complemento']
      ..cidade = map['cidade']
      ..estado = map['estado']
      ..estadoCivil = map['estado_civil']
      ..ocupacao = map['ocupacao']
      ..idUsuario = map['id_usuario']?.toInt();
  }

  Map toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
      'cns': cns,
      'dtNascimento': dtNascimento,
      'sexo': sexo,
      'cor': cor,
      'nomeMae': nomeMae,
      'nacionalidade': nacionalidade,
      'municipioNascimento': municipioNascimento,
      'telefone': telefone,
      'telefone2': telefone2,
      'email': email,
      'cep': cep,
      'endereco': endereco,
      'numero': numero,
      'complemento': complemento,
      'cidade': cidade,
      'estado': estado,
      'estadoCivil': estadoCivil,
      'ocupacao': ocupacao
    };
  }

  @override
  String toString() {
    return 'PacienteModel(id: $id, nome: $nome, cpf: $cpf, cns: $cns, dt_de_nascimento: $dtNascimento, sexo: $sexo, cor: $cor, nome_da_mae: $nomeMae, nacionalidade: $nacionalidade, municipio_de_nascimento: $municipioNascimento, telefone: $telefone, telefone2: $telefone2, email: $email, cep: $cep, endereço: $endereco, numero: $numero, complemento: $complemento, cidade: $cidade, estado: $estado, estado_civil: $estadoCivil, ocupacao: $ocupacao, dt_criacao: $dtCriacao, dt_atualizacao: $dtAtualizacao, id_usuario: $idUsuario)';
  }
}
