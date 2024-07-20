import 'package:get_it/get_it.dart';
import 'package:ingo/features/onBoard/data/datasource/on_board_datasource.dart';
import 'package:ingo/features/onBoard/data/repositories/on_board_repository_impl.dart';
import 'package:ingo/features/onBoard/domain/repositories/on_board_repository.dart';
import 'package:ingo/features/onBoard/domain/usecases/get_language.dart';
import 'package:ingo/features/onBoard/domain/usecases/is_logged_in.dart';
import 'package:ingo/features/onBoard/domain/usecases/log_in.dart';
import 'package:ingo/features/onBoard/domain/usecases/save_language.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator
    ..registerFactory<OnBoardDatasource>(
      () => OnBoardDatadourceImpl(
        sharedPreferences: serviceLocator(),
      ),
    )
    ..registerFactory<OnBoardRepository>(
      () => OnBoardRepositoryImpl(
        onBoardDatasource: serviceLocator(),
      ),
    )
    ..registerFactory<GetLanguage>(
      () => GetLanguage(
        onBoardRepository: serviceLocator(),
      ),
    )
    ..registerFactory<IsLoggedIn>(
      () => IsLoggedIn(
        onBoardRepository: serviceLocator(),
      ),
    )
    ..registerFactory<LogIn>(
      () => LogIn(
        onBoardRepository: serviceLocator(),
      ),
    )
    ..registerFactory<SaveLanguage>(
      () => SaveLanguage(
        onBoardRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton<OnBoardBloc>(
      () => OnBoardBloc(
        onBoardCount: 5,
        logIn: serviceLocator(),
        isLoggedIn: serviceLocator(),
        saveLanguage: serviceLocator(),
        getLanguage: serviceLocator(),
      ),
    );
}
