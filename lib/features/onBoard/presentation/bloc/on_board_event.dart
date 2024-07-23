part of 'on_board_bloc.dart';

@immutable
sealed class OnBoardEvent {}

final class OnBoardNextPage extends OnBoardEvent {}

final class OnBoardEventPreviousPageEvent extends OnBoardEvent {}

final class OnBoardLogInEvent extends OnBoardEvent {}

final class OnBoardIsLoggedInEvent extends OnBoardEvent {}

final class OnBoardSaveLanguageEvent extends OnBoardEvent {
  final Language language;

  OnBoardSaveLanguageEvent({required this.language});
}

final class OnBoardGetLanguageEvent extends OnBoardEvent {}
