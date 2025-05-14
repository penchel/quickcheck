import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickcheck/data/profile/user.dart';    // Importa o modelo User para registrar seu schema
import 'package:quickcheck/data/classroom/room.dart';
import 'package:quickcheck/data/students/student.dart';
import 'package:quickcheck/data/time_class/time.dart'; // Importa o modelo Room para registrar seu schema

/// Serviço responsável por inicializar e fornecer a instância do banco de dados Isar.
/// Mantém uma instância única (singleton) para todo o aplicativo.
class IsarService {
  // Variável privada que armazena a instância do Isar. Inicialmente nula.
  static Isar? _isar;

  /// Retorna a instância do Isar. Se ainda não estiver aberta, abre/cria o banco.
  ///
  /// - Garante que apenas uma instância de Isar exista (singleton).
  /// - Registra todos os schemas das coleções (UserSchema, RoomSchema).
  /// - Define o diretório onde os dados serão armazenados.
  static Future<Isar> getIsarInstance() async {
    // Se já houver instância, retorna imediatamente
    if (_isar != null) return _isar!;

    // Obtém o diretório de documentos do dispositivo (iOS/Android)
    final dir = await getApplicationDocumentsDirectory();

    // Abre (ou cria) o banco de dados Isar, registrando os schemas das coleções
    _isar = await Isar.open(
      [
        UserSchema, // Schema gerado para a coleção de usuários
        RoomSchema, // Schema gerado para a coleção de salas
        TimeSchema,
        StudentClassSchema
        
      ],
      directory: dir.path, // Local físico onde os arquivos do banco serão armazenados
    );

    // Retorna a instância agora inicializada
    return _isar!;
  }
}