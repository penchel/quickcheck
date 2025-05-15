import 'package:isar/isar.dart';
part 'presence_list.g.dart';

@collection
class PresenceList {
  Id id = Isar.autoIncrement;

  late int studentId;
  late int roomId;
  late int absences;
}
