import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:quickcheck/data/presence/presence_list.dart';
import 'package:quickcheck/data/time_class/time.dart';
import 'package:quickcheck/data/students/student.dart';
import 'package:quickcheck/features/cam/cam_page.dart';

class TimeDetailPage extends StatefulWidget {
  final Time time;
  final List<StudentClass> students;
  final Isar isar;

  const TimeDetailPage({
    super.key,
    required this.time,
    required this.students,
    required this.isar,
  });

  @override
  State<TimeDetailPage> createState() => _TimeDetailPageState();
}

class _TimeDetailPageState extends State<TimeDetailPage> {
  Map<int, bool> _absences = {};
  Map<int, int> _absencesCount = {};

  @override
  void initState() {
    super.initState();

    for (var s in widget.students) {
      _absences[s.id] = false;
      _absencesCount[s.id] = 0;
    }

    _loadExistingAbsences();
  }

  @override
  void dispose() {
    // Limpa checkboxes quando sair da página
    _absences.clear();
    super.dispose();
  }

  Future<void> _loadExistingAbsences() async {
    final roomId = widget.time.roomId;
    final studentIds = widget.students.map((e) => e.id).toList();

    if (studentIds.isEmpty) return;

    final presences = await widget.isar.presenceLists
        .filter()
        .roomIdEqualTo(roomId)
        .and()
        .anyOf(studentIds, (q, id) => q.studentIdEqualTo(id))
        .findAll();

    setState(() {
      for (var p in presences) {
        _absencesCount[p.studentId] = p.absences;
        // NÃO marca checkbox ao reabrir
      }
    });
  }

  Future<void> _saveAbsences() async {
    final roomId = widget.time.roomId;

    await widget.isar.writeTxn(() async {
      for (var entry in _absences.entries) {
        final studentId = entry.key;
        final isAbsent = entry.value;

        final presence = await widget.isar.presenceLists
            .filter()
            .studentIdEqualTo(studentId)
            .and()
            .roomIdEqualTo(roomId)
            .findFirst();

        if (isAbsent) {
          if (presence != null) {
            presence.absences += 1;
            await widget.isar.presenceLists.put(presence);
            _absencesCount[studentId] = presence.absences;
          } else {
            final newPresence = PresenceList()
              ..studentId = studentId
              ..roomId = roomId
              ..absences = 1;
            await widget.isar.presenceLists.put(newPresence);
            _absencesCount[studentId] = 1;
          }
        }
      }
    });

    setState(() {
      // NÃO limpa _absences aqui
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Faltas salvas com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.time.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: ${widget.time.data}', style: TextStyle(fontSize: 18)),
            Text('Hora: ${widget.time.hora.trim()}', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('Alunos:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.students.length,
                itemBuilder: (context, index) {
                  final student = widget.students[index];
                  return ListTile(
                    leading: student.photo.isNotEmpty
                        ? Image.asset(student.photo.trim(), width: 40, height: 40)
                        : Icon(Icons.person),
                    title: Text('${student.name} ${student.lastName}'),
                    subtitle: Text('CPF: ${student.cpf}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Faltas: ${_absencesCount[student.id] ?? 0}'),
                        SizedBox(width: 12),
                        Checkbox(
                          value: _absences[student.id] ?? false,
                          onChanged: (bool? val) {
                            setState(() {
                              _absences[student.id] = val ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Botões estilo "gordos" e fixados nos cantos
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CamPage()),
                        );
                      },
                      icon: Icon(Icons.camera_alt),
                      label: Text('Abrir Câmera'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _saveAbsences,
                      icon: Icon(Icons.save),
                      label: Text('Salvar Faltas'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
