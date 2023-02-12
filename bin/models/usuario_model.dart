class UsuarioModel {
  int? id;
  String? nome;
  String? user;
  String? email;
  String? password;
  bool? isAtivo;
  DateTime? dtCriacao;
  DateTime? dtAtualizacao;

  UsuarioModel();

  UsuarioModel.create(this.id, this.nome, this.user, this.email, this.isAtivo,
      this.dtCriacao, this.dtAtualizacao);

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel.create(
      map['id']?.toInt() ?? 0,
      map['nome'] ?? '',
      map['user'] ?? '',
      map['email'] ?? '',
      map['isAtivo'] == 1,
      map['dtCriacao'],
      map['dtAtualizacao'],
    );
  }

  factory UsuarioModel.fromUser(Map map) {
    return UsuarioModel()
      ..id = map['id']?.toInt()
      ..password = map['password'];
  }

  factory UsuarioModel.fromRequest(Map map) {
    return UsuarioModel()
      ..nome = map['nome']
      ..user = map['user']
      ..email = map['email']
      ..password = map['password'];
  }

  @override
  String toString() {
    return 'UsuarioModel(id: $id, nome: $nome, user $user, email: $email, isAtivo: $isAtivo, dtCriacao: $dtCriacao, dtAtualizacao: $dtAtualizacao)';
  }
}
