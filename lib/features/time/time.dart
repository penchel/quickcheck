import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:isar/isar.dart';
import 'package:quickcheck/data/isar_service.dart';
import 'package:quickcheck/data/time_class/time.dart'; // Supondo que esta importação esteja correta

class TimePage extends StatefulWidget {
  final int roomId;
  const TimePage({super.key, required this.roomId});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  // Não é necessário _times se você não o usa diretamente para construir o widget.
  // List<Time> _times = [];
  Map<int, Map<String, Time>> _slotMap = {}; // Inicialize como vazio
  bool _isLoading = true; // Adiciona um estado de carregamento

  final List<String> _weekDays = [
    'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo',
  ];

  final List<String> _hours = [
    '07:00', '08:00', '09:00', '10:00', '11:00', '12:00',
  ];

  @override
  void initState() {
    super.initState();
    print("🕒 initState para roomId: ${widget.roomId}");
    // Inicializa dados de localização e depois carrega os horários
    initializeDateFormatting('pt_BR', null).then((_) {
      _loadTimes();
    });
  }

  @override
  void didUpdateWidget(covariant TimePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.roomId != widget.roomId) {
      print('🔄 Room ID mudou de ${oldWidget.roomId} para ${widget.roomId}. Recarregando horários.');
      // Limpa o mapa e define o estado de carregamento para mostrar o indicador
      // e evitar mostrar dados antigos brevemente.
      // _loadTimes fará o setState final quando os dados estiverem prontos.
      _loadTimes(); // Já seta _isLoading = true no início
    }
  }

  Future<void> _loadTimes() async {
    // Define o estado de carregamento no início
    // Isso garante que o CircularProgressIndicator seja mostrado se _slotMap estiver vazio
    // ou se você optar por usá-lo explicitamente.
    if (mounted) { // Garante que o widget ainda está na árvore
        setState(() {
          _isLoading = true;
          _slotMap = {}; // Limpa dados antigos para evitar exibi-los durante o carregamento
        });
    }

    final isar = await IsarService.getIsarInstance();
    final currentRoomId = widget.roomId; // Pega o roomId atual do widget
    print('🔍 Carregando aulas para roomId: $currentRoomId');

    // Busca todas as aulas da sala no banco
    final times = await isar.times.filter().roomIdEqualTo(currentRoomId).findAll();
    print('✅ Aulas recuperadas para roomId $currentRoomId (${times.length}):');
    for (var t in times) {
      print('   • id=${t.id}, name=${t.name}, data=${t.data}, hora=${t.hora}');
    }

    // Constrói mapa de slots: diaIndex -> (hora -> Time)
    // Use um mapa local para construir e depois atualize o estado de uma vez.
    final newSlotMap = <int, Map<String, Time>>{};
    for (var t in times) {
      try {
        // Normaliza a string da hora para evitar problemas com espaços etc.
        final String horaNormalizada = t.hora.trim();
        // Verifica se a hora está no formato esperado (HH:mm)
        if (!_isValidHourFormat(horaNormalizada)) {
            print('⚠️ Formato de hora inválido "${t.hora}" para a aula "${t.name}", pulando.');
            continue;
        }

        final date = DateFormat('dd-MM-yyyy', 'pt_BR').parse(t.data);
        final dayIndex = date.weekday - 1; // 0 = segunda ... 6 = domingo

        newSlotMap.putIfAbsent(dayIndex, () => <String, Time>{});
        newSlotMap[dayIndex]![horaNormalizada] = t;

      } catch (e) {
        print('❌ Erro ao processar aula id=${t.id}, data=${t.data}, hora=${t.hora}: $e');
      }
    }

    // Debug do mapa
    print('🔧 slotMap construído para roomId $currentRoomId:');
    newSlotMap.forEach((day, hoursMap) {
      hoursMap.forEach((hour, aula) {
        print('   • diaIndex=$day, hora=$hour => name=${aula.name}');
      });
    });

    // Verifica se o widget ainda está montado antes de chamar setState
    if (mounted) {
      setState(() {
        // _times = times; // Atualize se você usar _times em outro lugar
        _slotMap = newSlotMap;
        _isLoading = false; // Carregamento concluído
      });
      print('✅ Estado atualizado com o novo slotMap para roomId $currentRoomId.');
    } else {
       print('⚠️ Widget desmontado antes de _loadTimes (${widget.roomId}) completar. setState não chamado.');
    }
  }

  // Função auxiliar para validar o formato da hora
  bool _isValidHourFormat(String hour) {
    return RegExp(r'^[0-2]\d:[0-5]\d$').hasMatch(hour);
  }


  @override
  Widget build(BuildContext context) {
    print('🏗️ Construindo widget para roomId: ${widget.roomId}, isLoading: $_isLoading, _slotMap isEmpty: ${_slotMap.isEmpty}');
    // Mostra o indicador de carregamento se _isLoading for true
    // ou se _slotMap estiver vazio E _isLoading for true (para cobrir o estado inicial antes do primeiro _loadTimes)
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Calendário Semanal')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    // Se não estiver carregando e o mapa estiver vazio (nenhuma aula encontrada)
    if (_slotMap.isEmpty && !_isLoading) {
        return Scaffold(
            appBar: AppBar(title: const Text('Calendário Semanal')),
            body: const Center(child: Text('Nenhuma aula agendada para esta sala.'))
        );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Calendário Semanal')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            // Cabeçalho: horas
            Row(
              children: [
                const SizedBox(width: 80), // Espaço para os nomes dos dias
                for (var hour in _hours)
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Text(hour, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            // Linhas: cada dia da semana
            for (int dayIndex = 0; dayIndex < _weekDays.length; dayIndex++)
              Row(
                children: [
                  // Nome do dia
                  Container(
                    width: 80,
                    height: 60,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(_weekDays[dayIndex], style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  // Células de cada hora
                  for (var hour in _hours) _buildCell(dayIndex, hour.trim()), // Usa .trim() na hora da lista _hours também por segurança
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCell(int dayIndex, String hour) {
    // Acesso ao mapa
    final Map<String, Time>? hourlySlots = _slotMap[dayIndex];
    final Time? aula = hourlySlots?[hour]; // A chave 'hour' deve corresponder exatamente
    final bool hasClass = aula != null;

    // Log mais detalhado para depuração
    if (hasClass) {
       print('🟩 Cell FOUND → diaIndex:$dayIndex, hora:"$hour", name:${aula.name}');
    } else {
       // Se não encontrou, mas esperava, logue o que existe para esse dia
       if (hourlySlots != null && hourlySlots.isNotEmpty) {
         print('🟨 Cell MISS → diaIndex:$dayIndex, hora:"$hour". Horas disponíveis neste dia: ${hourlySlots.keys.join(", ")}');
       } else if (hourlySlots != null && hourlySlots.isEmpty) {
         print('🟨 Cell MISS → diaIndex:$dayIndex, hora:"$hour". Nenhuma hora registrada para este dia no slotMap.');
       } else {
         // hourlySlots é null, o que significa que _slotMap[dayIndex] é null.
         // Isso é esperado se não há aulas nesse dia da semana.
         // print('🔳 Cell (no classes this day) → diaIndex:$dayIndex, hora:"$hour", hasClass:$hasClass');
       }
    }


    return Container(
      width: 80,
      height: 60,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: hasClass ? Colors.blue.shade100 : Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: hasClass
          ? Text(
              aula.name, // ! não é mais necessário devido à verificação hasClass
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          : const SizedBox(),
    );
  }
}