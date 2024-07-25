import 'package:bookly_hive/views/edit_note_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditNoteView(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(
            0xffFFcc80,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                "Flutter App",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Learn Flutter With Moahmed Ali',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                "May 20 , 2024",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
