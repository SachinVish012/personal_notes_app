import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_notes/common_widgets/custom_text.dart';
import 'package:personal_notes/common_widgets/loader.dart';
import 'package:personal_notes/core/constants/color_constants.dart';
import 'package:personal_notes/core/constants/string_constants.dart';
import 'package:personal_notes/core/routes/routes.dart';
import 'package:personal_notes/core/services/encryption_decryption_service/encryption_decryption_service.dart';
import 'package:personal_notes/core/utils/utils.dart';
import 'package:personal_notes/modules/home/bloc/home_bloc.dart';
import 'package:personal_notes/modules/home/notes_db/note_db.dart';
import 'package:personal_notes/modules/home/pages/add_notes.dart';
part 'widgets/add_first_note_widget.dart';
part 'widgets/notes_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final homeBloc = context.read<HomeBloc>();
  final encryptionService = EncryptionService();
  @override
  void initState() {
    super.initState();
    homeBloc.add(GetNotesEvent());
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      //----perform task if app is inactive. close or in inative
      homeBloc.add(UpdateDataToServerEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.push(
                  "${Routes.home}/${Routes.addNotes}",
                  extra: AddNotesParams(
                    title: StringConstants.writeNote,
                  ),
                );
              },
              backgroundColor: ColorConstants.blackShaded,
              child: const Icon(
                Icons.add,
                color: ColorConstants.white,
              ),
            ),
            appBar: AppBar(
              backgroundColor: ColorConstants.backgroundColor,
              title: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: StringConstants.notes,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              actions: [
                Visibility(
                  visible: state.notesList.isNotEmpty,
                  child: TextButton(
                    onPressed: () async {
                      homeBloc.add(ClearAllNoteEvent());
                    },
                    child: CustomText(
                      text: StringConstants.clearAll,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                10.horizontalSpace,
              ],
            ),
            body: state.isLoading
                ? const ShowLoader()
                : (state.notesList.isEmpty)
                    ? const Center(child: AddFirstNoteWidget())
                    : ListView.builder(
                        itemCount: state.notesList.length,
                        itemBuilder: (context, index) {
                          final data = state.notesList[index];
                          final decryNotes =
                              encryptionService.decryptData(data.notes);
                          final dates = getFriendlyDate(
                              encryptionService.decryptData(data.updatedOn));
                          return NoteCard(
                            dates: dates,
                            notes: decryNotes,
                            onDelete: () {
                              homeBloc.add(DeleteNoteByIdEvent(id: data.id));
                            },
                            onEdit: () {
                              context.push(
                                "${Routes.home}/${Routes.addNotes}",
                                extra: AddNotesParams(
                                    title: StringConstants.editNote,
                                    editData: NotesDBModel(
                                      id: data.id,
                                      notes: decryNotes,
                                      updatedOn: dates,
                                    )),
                              );
                            },
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}
