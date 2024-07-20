part of 'on_board_bloc.dart';

@immutable
sealed class OnBoardEvent {}

final class OnBoardNextPage extends OnBoardEvent {}

final class OnBoardEventPreviousPageEvent extends OnBoardEvent {}

final class OnBoardLogInEvent extends OnBoardEvent {}

final class OnBoardIsLoggedInEvent extends OnBoardEvent {}

final class OnBoardSaveLanguageEvent extends OnBoardEvent {
  final Locale locale;

  OnBoardSaveLanguageEvent({required this.locale});
}

final class OnBoardGetLanguageEvent extends OnBoardEvent {}
