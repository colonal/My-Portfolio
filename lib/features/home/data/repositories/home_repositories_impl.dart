import 'package:dartz/dartz.dart';

import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/home/data/datasources/home_remote_data_source.dart';
import 'package:my_profile/features/home/domain/entities/home.dart';
import 'package:my_profile/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl extends HomeRepositories {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoriesImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, Home>> getHomeData() async {
    try {
      final remote = await remoteDataSource.getDataHome();
      return Right(remote);
    } catch (e) {
      print("E: " + e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
