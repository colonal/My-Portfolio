import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_profile/features/home/data/datasources/home_remote_data_source.dart';
import 'package:my_profile/features/home/data/repositories/home_repositories_impl.dart';
import 'package:my_profile/features/home/domain/repositories/home_repositories.dart';
import 'package:my_profile/features/home/domain/usecasee/get_data_home.dart';
import 'package:my_profile/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => HomeBloc(getDataHome: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetDataHomeUsecase(repositories: sl()));

  // Repository
  sl.registerLazySingleton<HomeRepositories>(
      () => HomeRepositoriesImpl(remoteDataSource: sl()));

  // Datasources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(firebase: sl()));

  // External
  final firebase = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firebase);
}
