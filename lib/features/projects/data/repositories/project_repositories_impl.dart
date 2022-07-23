import '../datasources/project_remote_data_source.dart';
import '../../domain/entities/project.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/project_repositories.dart';

class ProjectRepositoriesImpl extends ProjectRepositories {
  final ProjectRemoteDataSource dataSource;

  ProjectRepositoriesImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<Project>>> getDataProject() async {
    try {
      return Right(await dataSource.getDataProject());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
