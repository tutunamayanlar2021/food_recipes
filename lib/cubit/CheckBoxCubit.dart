import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxCubit extends Cubit<bool> {
  CheckBoxCubit() : super(false);

  void isSelected() {
    emit(true);
  }

  void isnotSelected() {
    emit(false);
  }
}
