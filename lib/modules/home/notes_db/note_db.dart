import 'package:isar/isar.dart';

part 'note_db.g.dart';

@collection
class NotesDb {
  Id sRNumber = Isar.autoIncrement;
  List<NotesDBModel>? notesListDb;
  NotesDb({
    this.notesListDb,
  });
}

@embedded
class NotesDBModel {
  final String id;
  final String notes;
  final String updatedOn;
  NotesDBModel({
    this.id = '',
    this.notes = '',
    this.updatedOn = '',
  });
  NotesDBModel copyWith({
    String? id,
    String? notes,
    String? updatedOn,
  }) {
    return NotesDBModel(
      id: id ?? this.id,
      notes: notes ?? this.notes,
      updatedOn: updatedOn??this.updatedOn,
    );
  }
}
