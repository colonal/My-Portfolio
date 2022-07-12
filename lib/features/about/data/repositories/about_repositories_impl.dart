import 'package:dartz/dartz.dart';

import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/about/data/datasources/about_remote_data_source.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/domain/repositories/about_repositories.dart';

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
      print("ERORR About: " + e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
