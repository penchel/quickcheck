import 'package:isar/isar.dart';

part 'room.g.dart';

@collection
class Room {
  Id id = Isar.autoIncrement;

  late int userId;
  late String subject;
}
