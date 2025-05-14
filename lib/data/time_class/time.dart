import 'package:isar/isar.dart';
part 'time.g.dart';


@collection
class Time {
  Id id = Isar.autoIncrement;
  late List<int> studentIds; // Lista de IDs de alunos
  late int roomId;
  late String name;
  late String data;
  late String hora;
}
