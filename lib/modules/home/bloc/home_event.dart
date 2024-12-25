part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetNotesEvent extends HomeEvent {}
//----for create new event
class AddNoteEvent extends HomeEvent {
  final String text;
  AddNoteEvent({this.text = ''});
}
//---for update notes by id
class UpdateNoteByIdEvent extends HomeEvent {
  final String text;
  final String id;
  UpdateNoteByIdEvent({
    this.text = '',
    required this.id,
  });
}
//-----delete by id
class DeleteNoteByIdEvent extends HomeEvent {
  final String id;
  DeleteNoteByIdEvent({
    required this.id,
  });
}
//----delete all
class ClearAllNoteEvent extends HomeEvent{}
class UpdateDataToServerEvent extends HomeEvent {}
