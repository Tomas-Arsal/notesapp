import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/add_note_cubit/add_note_state.dart';
import '../../cubits/notes_cubit/notes_fetch_cubit.dart';
import '../models/note_model.dart';
import '../notes_view.dart';
import 'buttom_sheet.dart';
import 'colorListView.dart';
import 'text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

String? title, subTitle , content;

final GlobalKey<FormState> form = GlobalKey();

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              onSaved: (value) {
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'content',
              maxLines: 5,
            ),
            const ColorListView(),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<AddNoteCubit,AddNoteState>(
              listener: (context, state){},
              builder: (context, state) {
                return CustomButtomSheet(
                    isLoading: state is AddNoteLoading ? true: false,
                    onTap: () {
                      if (form.currentState!.validate()) {
                        form.currentState!.save();
                        var currentData =  DateTime.now();
                        var formatCurrentData = DateFormat('dd-mm-yyyy').format(currentData) ;
                        var noteModel = NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: formatCurrentData,
                            color: Colors.blue.value);
                        BlocProvider.of<AddNoteCubit>(context).addNotes(
                            noteModel);
                   ///     BlocProvider.of<NotesFetchCubit>(context).fetchAllNotes();
                         Navigator.of(context).pushReplacementNamed(NotesView.route);
                        ///  Navigator.of(context).pop();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
