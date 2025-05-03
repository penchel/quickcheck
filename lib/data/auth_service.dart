/// Serviço de autenticação global (Singleton) para gerenciar o estado de login do usuário.
class AuthService {
  // Instância única do AuthService, garantida pelo padrão Singleton.
  static final AuthService _instance = AuthService._internal();

  /// Construtor factory que retorna sempre a mesma instância.
  factory AuthService() {
    return _instance;
  }

  /// Construtor interno privado, chamado apenas uma vez para criar a instância singleton.
  AuthService._internal();

  /// Armazena o ID do usuário logado. Pode ser nulo se não houver login.
  int? _userId;

  /// Getter público para acessar o ID do usuário logado.
  /// Retorna null se nenhum usuário estiver logado.
  int? get userId => _userId;

  /// Realiza o login definindo o ID do usuário.
  ///
  /// [userId] é o identificador único do usuário autenticado no sistema.
  void login(int userId) {
    _userId = userId;
  }

  /// Realiza o logout, limpando o ID do usuário.
  /// Quando chamado, o usuário deixa de estar autenticado.
  void logout() {
    _userId = null;
  }

  /// Indica se há um usuário atualmente logado.
  /// Retorna `true` se `userId` não for nulo.
  bool get isLoggedIn => _userId != null;
}
