import 'package:bookly_hive/widgets/notes_item.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const NotesItem();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: 10,
    );
  }
}
