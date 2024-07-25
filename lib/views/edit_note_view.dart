import 'package:bookly_hive/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
              hintText: 'title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'content',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
