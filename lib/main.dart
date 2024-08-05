import 'package:bookly_hive/cubits/change_app_color_cubit/change_app_color_cubit.dart';
import 'package:bookly_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:bookly_hive/simple_bloc_observer.dart';
import 'package:bookly_hive/utils/constants.dart';
import 'package:bookly_hive/utils/enums.dart';
import 'package:bookly_hive/views/notes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'models/note_model.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  // await Hive.openBox<Color>(appColorKey);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit()..getAllNotes(),
        ),
        BlocProvider(
          create: (context) => ChangeAppColorCubit(
            ColorSeed.green,
          ),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constaints) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                  side: BorderSide.none,
                ),
                // backgroundColor: kPrimaryColor,
                // foregroundColor: Colors.black,
              ),
              colorSchemeSeed: context.watch<ChangeAppColorCubit>().state.color,
            ),
            home: const NotesView(),
          );
        },
      ),
    );
  }
}
