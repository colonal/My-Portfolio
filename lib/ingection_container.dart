import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_profile/features/about/data/datasources/about_remote_data_source.dart';
import 'package:my_profile/features/about/data/repositories/about_repositories_impl.dart';
import 'package:my_profile/features/about/domain/repositories/about_repositories.dart';
import 'package:my_profile/features/about/domain/usecases/about_usecases.dart';

import 'package:my_profile/features/home/data/datasources/home_remote_data_source.dart';
import 'package:my_profile/features/home/data/repositories/home_repositories_impl.dart';
import 'package:my_profile/features/home/domain/repositories/home_repositories.dart';
import 'package:my_profile/features/home/domain/usecasee/get_data_home.dart';
import 'package:my_profile/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_profile/features/skills/data/datasources/skills_remote_data_source.dart';
import 'package:my_profile/features/skills/data/repositories/skills_repositories.dart';
import 'package:my_profile/features/skills/domin/repositories/skills_repositories.dart';
import 'package:my_profile/features/skills/domin/usecases/skills_usecases.dart';
import 'package:my_profile/features/skills/presentation/bloc/skills_bloc.dart';

import 'features/about/presentation/bloc/about_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //  Features Home
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

  //  Features About
  // Bloc
  sl.registerFactory(() => AboutBloc(aboutUsecases: sl()));

  // usecase
  sl.registerLazySingleton(() => AboutUsecases(repositories: sl()));

  // repositories
  sl.registerLazySingleton<AboutRepositories>(
      () => AboutRepositoriesImpl(dataSource: sl()));

  // dataSource
  sl.registerLazySingleton<AboutRemoteDataSource>(
      () => AboutRemoteDataSourceImpl(firebase: sl()));

  //  Feature Skills
  // Bloc
  sl.registerFactory(() => SkillsBloc(sl()));

  // usecase
  sl.registerLazySingleton(() => SkillsUsecases(skillsRepositories: sl()));

  // repositories
  sl.registerLazySingleton<SkillsRepositories>(
      () => SkillsRrepositoriesImpl(source: sl()));

  // dataSourse
  sl.registerLazySingleton<SkillsRemoteDataSource>(
      () => SkillsRemoteDataSourceImpl(firebase: sl()));

  // External
  final firebase = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firebase);
}
