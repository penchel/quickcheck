import 'package:isar/isar.dart';    // complete package
part 'student.g.dart';


@collection  // will become a table in the bank
class StudentClass {

  Id id = Isar.autoIncrement;
  late String name;
  late String lastName;
  late String cpf;
  late String photo;

}

