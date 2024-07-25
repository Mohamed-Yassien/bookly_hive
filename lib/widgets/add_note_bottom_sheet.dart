import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'title',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
