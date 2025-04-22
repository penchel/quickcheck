import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickcheck/data/profile/user.dart';

class IsarService {
  static Isar? _isar;   // can be null and is unique

  static Future<Isar> getIsarInstance() async {
    if (_isar != null) return _isar!;   // if it has already been opened
    final dir = await getApplicationDocumentsDirectory();   // saving locally may take time

    _isar = await Isar.open(    // opens or creates the bank
      [UserSchema],
      directory: dir.path,
    );
    return _isar!;    // is the object that controls everything in the data bank
  }
}
