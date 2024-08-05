import 'package:bookly_hive/widgets/change_app_color_widget.dart';
import 'package:bookly_hive/widgets/notes_view_body.dart';
import 'package:flutter/material.dart';

import '../widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ChangeAppColorWidget(),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                },
              );
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: const NotesViewBody(),
    );
  }
}
