import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ingo/core/errors/failure.dart';
import 'package:ingo/core/usecases/usecase.dart';
import 'package:ingo/features/onBoard/domain/usecases/get_language.dart';
import 'package:ingo/features/onBoard/domain/usecases/is_logged_in.dart';
import 'package:ingo/features/onBoard/domain/usecases/log_in.dart';
import 'package:ingo/features/onBoard/domain/usecases/save_language.dart';
import 'package:ingo/init_dependencies.main.dart';

part 'on_board_event.dart';
part 'on_board_state.dart';

class OnBoardBloc extends Bloc<OnBoardEvent, OnBoardState> {
  int _currentIndex = 0;
  final int _onBoardCount;
  final LogIn _logIn;
  final IsLoggedIn _isLoggedIn;
  final SaveLanguage _saveLanguage;
  final GetLanguage _getLanguage;

  int get currentIndex => _currentIndex;

  OnBoardBloc({
    required int onBoardCount,
    required LogIn logIn,
    required IsLoggedIn isLoggedIn,
    required SaveLanguage saveLanguage,
    required GetLanguage getLanguage,
  })  : _onBoardCount = onBoardCount,
        _isLoggedIn = isLoggedIn,
        _logIn = logIn,
        _saveLanguage = saveLanguage,
        _getLanguage = getLanguage,
        super(OnBoardInitial()) {
    on<OnBoardNextPage>((event, emit) {
      if (_currentIndex < _onBoardCount - 1) {
        _currentIndex++;
        emit(OnBoardPageChangedState(currentIndex: _currentIndex));
      } else {
        emit(OnBoardPageFinishedState());
      }
    });

    on<OnBoardEventPreviousPageEvent>((event, emit) {
      if (_currentIndex > 0) {
        _currentIndex--;
        emit(OnBoardPageChangedState(currentIndex: _currentIndex));
      } else {
        emit(OnBoardPageFirstState());
      }
    });

    on<OnBoardGetLanguageEvent>((event, emit) {
      var value = _getLanguage(NoParams());
      value.fold(
        (l) => OnBoardFailureState(message: l.message),
        (r) => OnBoardLanguageState(locale: r),
      );
    });

    on<OnBoardSaveLanguageEvent>((event, emit) async {
      var value = await _saveLanguage(event.locale);
      value.fold(
        (l) => OnBoardFailureState(message: l.message),
        (r) => OnBoardSuccessState(value: r),
      );
    });
  }
}
