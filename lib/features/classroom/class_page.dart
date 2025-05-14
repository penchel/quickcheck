import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:quickcheck/data/isar_service.dart';
import 'package:quickcheck/data/classroom/room.dart'; // A importação do modelo Room, que define a estrutura de dados para sala
import 'package:quickcheck/data/auth_service.dart';
import 'package:quickcheck/features/time/time.dart'; // Importa o serviço de autenticação que guarda o ID do usuário

class ClassPage extends StatefulWidget {
  // Construtor sem parâmetros obrigatórios, pois o usuário já está autenticado globalmente
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  // Lista que armazenará as salas carregadas do banco de dados
  List<Room> _rooms = [];

  @override
  void initState() {
    super.initState();
    // Carrega as salas assim que o widget é inicializado
    _loadRooms();
  }

  /// Carrega todas as salas criadas pelo usuário logado
  Future<void> _loadRooms() async {
    // Obtém a instância do banco de dados Isar
    final isar = await IsarService.getIsarInstance();
    // Recupera o userId armazenado no AuthService (singleton)
    final userId = AuthService().userId;
    // Filtra as salas no banco pelo userId e obtém todas
    final rooms = await isar.rooms
        .filter()
        .userIdEqualTo(userId!) // Garante que userId não é nulo
        .findAll();

    // Atualiza o estado com as salas carregadas, acionando rebuild do widget
    setState(() {
      _rooms = rooms;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Estrutura básica da página com AppBar, lista e botão flutuante
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Salas')),
      body: ListView.builder(
        itemCount: _rooms.length,
        itemBuilder: (_, index) {
          final room = _rooms[index];
          // Cada sala é exibida em um Card com um ícone e o nome da sala
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.meeting_room),
              title: Text(room.subject), // Exibe o nome da sala
              onTap: () {
                final roomId = room.id; // ✅ Aqui você pega o ID da sala
                print('ID da sala selecionada: $roomId');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TimePage(roomId: roomId), // você pode passar o roomId para a próxima tela
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}
