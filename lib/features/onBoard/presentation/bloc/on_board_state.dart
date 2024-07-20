part of 'on_board_bloc.dart';

@immutable
sealed class OnBoardState {}

final class OnBoardInitial extends OnBoardState {}

final class OnBoardPageChangedState extends OnBoardState {
  final int currentIndex;

  OnBoardPageChangedState({required this.currentIndex});
}

final class OnBoardPageFirstState extends OnBoardState {}

final class OnBoardPageFinishedState extends OnBoardState {}

final class OnBoardLanguageState extends OnBoardState {
  final Locale locale;

  OnBoardLanguageState({required this.locale});
}

final class OnBoardSuccessState extends OnBoardState {
  final bool value;

  OnBoardSuccessState({required this.value});
}

final class OnBoardFailureState extends OnBoardState {
  final String message;
  OnBoardFailureState({required this.message});
}
