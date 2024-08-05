import 'package:bookly_hive/utils/constants.dart';
import 'package:bookly_hive/utils/enums.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ChangeAppColorCubit extends HydratedCubit<ColorSeed> {
  ChangeAppColorCubit(super.state);

  void changeAppColor(ColorSeed colorSeed) {
    emit(colorSeed);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return ColorSeed.values.firstWhere(
      (element) => element.label == json[appColorKey],
      orElse: () => state,
    );
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return {appColorKey: state.label};
  }
}
