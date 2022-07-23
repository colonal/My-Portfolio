import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/project.dart';
import '../repositories/project_repositories.dart';

class GetDataProjectUsecase {
  final ProjectRepositories repositories;
  GetDataProjectUsecase({
    required this.repositories,
  });

  Future<Either<Failure, List<Project>>> call() async {
    return await repositories.getDataProject();
  }
}
