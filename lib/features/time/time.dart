import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:isar/isar.dart';
import 'package:quickcheck/data/isar_service.dart';
import 'package:quickcheck/data/students/student.dart';
import 'package:quickcheck/data/time_class/time.dart';
import 'package:quickcheck/features/time/time_detail_page.dart';

class TimePage extends StatefulWidget {
  final int roomId;
  const TimePage({super.key, required this.roomId});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Map<int, Map<String, Time>> _slotMap = {};
  bool _isLoading = true;

  final List<String> _weekDays = [
    'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo',
  ];

  final List<String> _hours = [
    '07:00', '08:00', '09:00', '10:00', '11:00', '12:00',
  ];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null).then((_) {
      _loadTimes();
    });
  }

  @override
  void didUpdateWidget(covariant TimePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.roomId != widget.roomId) {
      _loadTimes();
    }
  }

  Future<void> _loadTimes() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _slotMap = {};
      });
    }

    final isar = await IsarService.getIsarInstance();
    final currentRoomId = widget.roomId;

    final times = await isar.times.filter().roomIdEqualTo(currentRoomId).findAll();

    final newSlotMap = <int, Map<String, Time>>{};
    for (var t in times) {
      try {
        final String horaNormalizada = t.hora.trim();
        if (!_isValidHourFormat(horaNormalizada)) continue;

        final date = DateFormat('dd-MM-yyyy', 'pt_BR').parse(t.data);
        final dayIndex = date.weekday - 1;

        newSlotMap.putIfAbsent(dayIndex, () => <String, Time>{});
        newSlotMap[dayIndex]![horaNormalizada] = t;
      } catch (e) {
        // Ignore erros de parsing
      }
    }

    if (mounted) {
      setState(() {
        _slotMap = newSlotMap;
        _isLoading = false;
      });
    }
  }

  bool _isValidHourFormat(String hour) {
    return RegExp(r'^[0-2]\d:[0-5]\d$').hasMatch(hour);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Calendário Semanal')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_slotMap.isEmpty && !_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Calendário Semanal')),
        body: const Center(child: Text('Nenhuma aula agendada para esta sala.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Calendário Semanal')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _buildTable(),
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Column(
      children: [
        // Cabeçalho: horas
        Row(
          children: [
            const SizedBox(width: 80), // espaço para nomes dos dias
            for (var hour in _hours)
              Container(
                width: 70,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(hour, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
        // Linhas: dias da semana
        for (int dayIndex = 0; dayIndex < _weekDays.length; dayIndex++)
          Row(
            children: [
              // Nome do dia
              Container(
                width: 80,
                height: 60,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 8),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(_weekDays[dayIndex], style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              // Células de cada hora
              for (var hour in _hours) _buildCell(dayIndex, hour.trim()),
            ],
          ),
      ],
    );
  }

  Widget _buildCell(int dayIndex, String hour) {
    final Map<String, Time>? hourlySlots = _slotMap[dayIndex];
    final Time? aula = hourlySlots?[hour];
    final bool hasClass = aula != null;

    final cellContent = Container(
      width: 70,
      height: 60,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: hasClass ? Colors.blue.shade100 : Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: hasClass
          ? FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          aula.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      )
          : const SizedBox(),
    );

    return hasClass
        ? InkWell(
      onTap: () async {
        final isar = await IsarService.getIsarInstance();

        final studentIds = aula.studentIds;
        final students = await isar.studentClass
            .filter()
            .anyOf(studentIds, (q, id) => q.idEqualTo(id))
            .findAll();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TimeDetailPage(
              time: aula,
              students: students,
              isar: isar,
            ),
          ),
        );
      },
      child: cellContent,
    )
        : cellContent;
  }
}
