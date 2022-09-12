import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
}
