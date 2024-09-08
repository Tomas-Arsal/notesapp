import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit/notes_fetch_cubit.dart';
import '../../views/models/note_model.dart';
import '../../views/widgets/edit_notes_view.dart';
import '../../views/widgets/list_view_note.dart';
import '../../views/widgets/list_view_note_item.dart';
import '../../views/widgets/notes_view_body.dart';

Widget buildArticleItem(article, context) => InkWell(
onTap: () {
        navigateTo(
            context,
            const NotesViewBody() ,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: BlocBuilder<NotesFetchCubit, NotesFetchState>(
          builder: (context, state) {
            List<NoteModel> notes =
                BlocProvider.of<NotesFetchCubit>(context).notes!;
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ListViewNoteItem(
                        noteModel: notes[index],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => separatorBuilderItem(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );

Widget separatorBuilderItem() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.brown,
        height: 5.0,
      ),
    );

void navigateTo(context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String label,
  required validate,
  ontap,
  onchanged,
  required IconData prefix,
  IconData? suffix,
  suffixPressed,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
      validator: validate,
      onTap: ontap,
      onChanged: onchanged,
    );
