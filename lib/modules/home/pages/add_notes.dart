import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_notes/common_widgets/custom_text.dart';
import 'package:personal_notes/core/constants/color_constants.dart';
import 'package:personal_notes/modules/home/bloc/home_bloc.dart';
import 'package:personal_notes/modules/home/notes_db/note_db.dart';

class AddNotesParams {
  final NotesDBModel? editData;
  final String title;
  AddNotesParams({
    this.editData,
    required this.title,
  });
}

class AddNotes extends StatefulWidget {
  final AddNotesParams params;
  const AddNotes({
    super.key,
    required this.params,
  });

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final homeBloc = context.read<HomeBloc>();
  @override
  void initState() {
    super.initState();
    if (widget.params.editData != null) {
      _controller.text = widget.params.editData!.notes;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.backgroundColor,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstants.white,
            ),
          ),
          title: CustomText(
            text: widget.params.title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorConstants.white,
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (widget.params.editData != null) {
                  homeBloc.add(
                    UpdateNoteByIdEvent(
                      id: widget.params.editData!.id,
                      text: _controller.text,
                    ),
                  );
                } else if (_controller.text.isNotEmpty) {
                  homeBloc.add(
                    AddNoteEvent(
                      text: _controller.text,
                    ),
                  );
                }

                context.pop();
              },
              icon: const Icon(
                Icons.check,
                color: ColorConstants.white,
              ),
            ),
            10.horizontalSpace,
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            padding: EdgeInsets.all(8.h),
            child: TextField(
              controller: _controller,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              cursorColor: ColorConstants.grey,
              autofocus: true,
              focusNode: _focusNode,
              style: TextStyle(fontSize: 18.sp, color: ColorConstants.white),
              inputFormatters: [
                LengthLimitingTextInputFormatter(500),
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
