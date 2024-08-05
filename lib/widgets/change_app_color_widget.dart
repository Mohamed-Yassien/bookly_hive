import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/change_app_color_cubit/change_app_color_cubit.dart';
import '../utils/enums.dart';

class ChangeAppColorWidget extends StatelessWidget {
  const ChangeAppColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = context.watch<ChangeAppColorCubit>();
    return PopupMenuButton<ColorSeed>(
      onSelected: (value) {
        context.read<ChangeAppColorCubit>().changeAppColor(value);
      },
      itemBuilder: (context) {
        return List.generate(ColorSeed.values.length, (index) {
          ColorSeed colorSeed = ColorSeed.values[index];
          return PopupMenuItem(
            value: colorSeed,
            // enabled: colorSeed != appColor.state,
            child: Container(
              color: colorSeed.color,
              width: double.infinity,
              height: kMinInteractiveDimension / 1.5,
              child: Visibility(
                  visible: colorSeed == appColor.state,
                  child: const Center(
                    child: Icon(Icons.done),
                  )),
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const CircleAvatar(
        radius: 28,
        child: Icon(
          Icons.palette_outlined,
        ),
      ),
    );
  }
}
