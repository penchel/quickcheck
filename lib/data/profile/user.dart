import 'package:isar/isar.dart';    // complete package
part 'user.g.dart'; // automatically generated


@collection  // will become a table in the bank
class User {
  Id id = Isar.autoIncrement;

  late String username;
  late String password;
  late String cpf;
  late String institution;
  late String email;
}

