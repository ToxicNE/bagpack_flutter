import 'package:bagpack/bloc/settings_bloc/settings_events.dart';
import 'package:bagpack/bloc/settings_bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsDeleteAllButtonLoadingState()) {
    on<DeleteAllButtonTapEvent>((event, emit) {
      emit(SettingsDeleteAllButtonLoadedState());
    });
  }
}


// 7 строчка ошибка нужно свои методы прописать
