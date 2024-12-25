import 'package:get_it/get_it.dart';
import 'package:personal_notes/modules/auth/bloc/auth_bloc.dart';
import 'package:personal_notes/modules/home/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  serviceLocator.registerFactory(() => AuthBloc());
  serviceLocator.registerLazySingleton(() => HomeBloc());
}
