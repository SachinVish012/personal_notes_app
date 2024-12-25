import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_notes/modules/home/notes_db/note_db.dart';

class IsarDbService {
  late Future<Isar> db;

  IsarDbService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    var dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          NotesDbSchema,
        ],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
