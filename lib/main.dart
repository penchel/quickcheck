import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickcheck/data/classroom/room.dart';
import 'package:quickcheck/data/profile/user.dart';
import 'package:quickcheck/data/students/student.dart';
import 'package:quickcheck/data/time_class/time.dart';
import 'package:quickcheck/features/profile/register_page.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    final prefs = await SharedPreferences.getInstance();
    final alreadyImported = prefs.getBool('already_imported') ?? false;

    if (!alreadyImported) {
      try {
        await import();
        await prefs.setBool('already_imported', true);
      } catch (e, stack) {
        debugPrint('Erro durante importação: $e');
        debugPrint(stack.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

Future<void> import() async {
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [RoomSchema, StudentClassSchema, TimeSchema, UserSchema],
    directory: dir.path,
  );

  // --- Importar SALAS ---
  final csvRoom = await rootBundle.loadString('assets/csv/classroom.csv');
  final rowsRoom = const CsvToListConverter(fieldDelimiter: ';').convert(csvRoom, eol: '\n');

  for (var row in rowsRoom.skip(1)) {
    if (row.length < 4) continue; // proteção contra linhas incompletas
    final room = Room()
      ..userId = int.parse(row[1].toString())
      ..subject = row[2].toString()
      ..anoLetivo = int.parse(row[3].toString())
      ..semestre = row[4].toString();

    await isar.writeTxn(() => isar.rooms.put(room));
  }
  debugPrint('Salas importadas com sucesso!');

  // --- Importar ALUNOS ---
  final csvStudents = await rootBundle.loadString('assets/csv/students.csv');
  final rowsStudents = const CsvToListConverter(fieldDelimiter: ';').convert(csvStudents, eol: '\n');

  for (var row in rowsStudents.skip(1)) {
    if (row.length < 5) continue;
    final student = StudentClass()
      ..name = row[1].toString()
      ..lastName = row[2].toString()
      ..cpf = row[3].toString()
      ..photo = row[4].toString();

    await isar.writeTxn(() => isar.studentClass.put(student));
  }
  debugPrint('Alunos importados com sucesso!');

  // --- Importar HORÁRIOS ---
  final csvTimes = await rootBundle.loadString('assets/csv/time_room.csv');
  final rowsTimes = const CsvToListConverter(fieldDelimiter: ';').convert(csvTimes, eol: '\n');

  for (var row in rowsTimes.skip(1)) {
    if (row.length < 6) continue;
    final time = Time()
      ..studentIds = row[1].toString().split(',').map((e) => int.tryParse(e) ?? 0).toList()
      ..roomId = int.parse(row[2].toString())
      ..name = row[3].toString()
      ..data = row[4].toString()
      ..hora = row[5].toString();

    await isar.writeTxn(() => isar.times.put(time));
  }
  debugPrint('Horários importados com sucesso!');

  // --- Importar USUÁRIOS ---
  final csvUsers = await rootBundle.loadString('assets/csv/user.csv');
  final rowsUsers = const CsvToListConverter(fieldDelimiter: ';').convert(csvUsers, eol: '\n');

  for (var row in rowsUsers.skip(1)) {
    if (row.length < 6) continue;
    final user = User()
      ..username = row[1].toString()
      ..password = row[2].toString()
      ..cpf = row[3].toString()
      ..institution = row[4].toString()
      ..email = row[5].toString();

    await isar.writeTxn(() => isar.users.put(user));
  }
  debugPrint('Usuários importados com sucesso!');

  await isar.close();
}
