import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/home_remote_data_source.dart';
import '../../domain/entities/home.dart';
import '../../domain/repositories/home_repositories.dart';

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
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
