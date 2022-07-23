import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/about_remote_data_source.dart';
import '../../domain/entities/about.dart';
import '../../domain/repositories/about_repositories.dart';

class AboutRepositoriesImpl extends AboutRepositories {
  final AboutRemoteDataSource dataSource;
  AboutRepositoriesImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, About>> getAboutData() async {
    try {
      final remote = await dataSource.getDataAbout();
      return Right(remote);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
