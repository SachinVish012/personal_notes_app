part of 'home_bloc.dart';

class HomeState {
  final bool isLoading;
  List<NotesDBModel> notesList;
  HomeState({
    required this.isLoading,
    this.notesList = const [],
  });
  factory HomeState.init() => HomeState(
        isLoading: false,
        notesList: const [],
      );
  HomeState copyWith({
    bool? isLoading,
    List<NotesDBModel>? notesList,
  }) =>
      HomeState(
        isLoading: isLoading ?? this.isLoading,
        notesList: notesList ?? this.notesList,
      );
}
