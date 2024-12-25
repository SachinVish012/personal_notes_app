import 'package:isar/isar.dart';
import 'package:personal_notes/core/services/isar_db_service.dart/isar_db_service.dart';
import 'package:personal_notes/modules/home/notes_db/note_db.dart';

class NotesDbService {
  final _db = IsarDbService();

  // Add a new note
  Future<void> addNoteInDb({required NotesDb note}) async {
    final isar = await _db.db;

    await isar.writeTxn(() async {
      //---Check if a record already exists in the database
      final existingNote = await isar.notesDbs.get(note.sRNumber);

      if (existingNote != null) {
        //----Add the new note to the top of the existing notesListDb. for latest data on top.
        existingNote.notesListDb = [
          ...?note.notesListDb,
          ...?existingNote.notesListDb,
        ];

        //--Update the existing record
        await isar.notesDbs.put(existingNote);
      } else {
        //--If no data existing record,add the new note
        await isar.notesDbs.put(note);
      }
    });
  }

  // Get all notes
  Future<List<NotesDb>> getAllNotes() async {
    final isar = await _db.db;
    return await isar.notesDbs.where().findAll();
  }

  // Update a note by ID
  Future<void> updateNoteById({
    required String id,
    required String updatedText,
    required String updatedOn,
  }) async {
    final isar = await _db.db;

    await isar.writeTxn(() async {
      // Find the parent NotesDb containing the specific note ID
      final parentNote = await isar.notesDbs
          .filter()
          .notesListDbElement((q) => q.idEqualTo(id))
          .findFirst();

      if (parentNote != null && parentNote.notesListDb != null) {
        // Update the specific note within the notesListDb
        parentNote.notesListDb = parentNote.notesListDb?.map((note) {
          if (note.id == id) {
            return NotesDBModel(
              id: note.id,
              notes: updatedText,
              updatedOn: updatedOn,
            );
          }
          return note;
        }).toList();
        await isar.notesDbs.put(parentNote);
      }
    });
  }

  // Delete a note by ID
  Future<void> deleteNoteById(String id) async {
    final isar = await _db.db;

    await isar.writeTxn(() async {
      //---Find the parent NotesDb containing the specific note ID
      final parentNote = await isar.notesDbs
          .filter()
          .notesListDbElement((q) => q.idEqualTo(id))
          .findFirst();

      if (parentNote != null) {
        //---Remove the note with the matching ID from the notesListDb
        parentNote.notesListDb =
            parentNote.notesListDb?.where((note) => note.id != id).toList();

        //---notesListDb is empty, delete the parent record
        if (parentNote.notesListDb == null || parentNote.notesListDb!.isEmpty) {
          await isar.notesDbs.delete(parentNote.sRNumber);
        } else {
          // Otherwise, update the parent record
          await isar.notesDbs.put(parentNote);
        }
      }
    });
  }

  // Get a single note by ID
  Future<NotesDb?> getNoteById(int id) async {
    final isar = await _db.db;
    return await isar.notesDbs.get(id);
  }

  // Clear all notes
  Future<void> clearAllNotes() async {
    final isar = await _db.db;
    await isar.writeTxn(() async {
      await isar.notesDbs.clear();
    });
  }
}
