import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:personal_notes/core/services/encryption_decryption_service/encryption_decryption_service.dart';
import 'package:personal_notes/core/utils/utils.dart';
import 'package:personal_notes/modules/home/notes_db/note_db.dart';
import 'package:personal_notes/modules/home/notes_db/notes_db_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _notesDb = NotesDbService();
  final encryptionService = EncryptionService();
  HomeBloc() : super(HomeState.init()) {
    on<AddNoteEvent>(_addNoteEvent);
    on<GetNotesEvent>(_getNotesEvent);
    on<ClearAllNoteEvent>(_clearAllNoteEvent);
    on<DeleteNoteByIdEvent>(_deleteNoteByIdEvent);
    on<UpdateNoteByIdEvent>(_updateNotesById);
    on<UpdateDataToServerEvent>(_updateDataToServerEvent);
  }
  //---update Data if app life cycle is paused or inactive
  _updateDataToServerEvent(
    UpdateDataToServerEvent event,
    Emitter<HomeState> emit,
  ) async {
    final data = await _notesDb.getAllNotes();
    if (data.isNotEmpty) {
      //----send to server
    }
    await Isolate.spawn(isolateTask, "port");
  }
  //----Perform Task with isolate
  void isolateTask(port){

  }

  //----update notes by id
  _updateNotesById(
    UpdateNoteByIdEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final today = DateTime.now();
      final formattedDateWithTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(today);
      final encryDate = encryptionService.encryptData(formattedDateWithTime);
      final encryNote = encryptionService.encryptData(event.text);
      final List<NotesDBModel> notesList = state.notesList;
      final updatedNotesList = notesList.map((note) {
        if (note.id == event.id) {
          return note.copyWith(
            notes: encryNote,
            updatedOn: encryDate,
          );
        }
        return note;
      }).toList();
      emit(state.copyWith(notesList: updatedNotesList));
      await _notesDb.updateNoteById(
        id: event.id,
        updatedText: encryNote,
        updatedOn: encryDate,
      );
    } catch (e, st) {
      debugPrint("---$e--$st");
    }
  }

  //---delete notes by id
  _deleteNoteByIdEvent(
    DeleteNoteByIdEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final List<NotesDBModel> notesList = state.notesList;
      notesList.removeWhere((note) => note.id == event.id);
      emit(state.copyWith(notesList: notesList));
      await _notesDb.deleteNoteById(event.id);
    } catch (e, st) {
      debugPrint("---$e--$st");
    }
  }

  //---clear all data
  _clearAllNoteEvent(
    ClearAllNoteEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(notesList: []));
    await _notesDb.clearAllNotes();
  }

  //----get notes from local db
  _getNotesEvent(
    GetNotesEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final data = await _notesDb.getAllNotes();
      //----added for show loader on home page. its just to show loading.
      await Future.delayed(const Duration(seconds: 2));
      if (data.isNotEmpty) {
        final notesList = data
            .where((noteDb) => noteDb.notesListDb != null)
            .expand((noteDb) => noteDb.notesListDb!)
            .toList();
        emit(state.copyWith(notesList: notesList));
      }
    } catch (e, st) {
      debugPrint("---$e--$st");
    } finally {
      emit(state.copyWith(isLoading: false));
//-----For background task. when user will com on home page and after 5 min.
      //initializeBackgroundService();
    }
  }

//----add new notes
  _addNoteEvent(
    AddNoteEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final userId = generateUniqueId();
      final today = DateTime.now();
      final formattedDateWithTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(today);
      final encryDate = encryptionService.encryptData(formattedDateWithTime);
      final encryNote = encryptionService.encryptData(event.text);

      final List notesList = state.notesList;
      final List<NotesDBModel> updatedList = [
        NotesDBModel(id: userId, notes: encryNote, updatedOn: encryDate),
        ...notesList
      ];
      emit(state.copyWith(notesList: updatedList));
      await _notesDb.addNoteInDb(
        note: NotesDb(
          notesListDb: [
            NotesDBModel(
              id: userId,
              notes: encryNote,
              updatedOn: encryDate,
            ),
          ],
        ),
      );
    } catch (e, st) {
      debugPrint("---$e--$st");
    }
  }

  //------we can also call by after a time
  Future<void> initializeBackgroundService() async {
    final service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(),
    );
    await service.startService();
  }

  void onStart(ServiceInstance service) {
    Timer.periodic(const Duration(minutes: 5), (timer) async {
      add(UpdateDataToServerEvent());
    });
  }

  @override
  Future<void> close() {
    HomeState.init();
    return super.close();
  }
}
