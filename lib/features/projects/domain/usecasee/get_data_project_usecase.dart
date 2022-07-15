import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/projects/domain/entities/project.dart';
import 'package:my_profile/features/projects/domain/repositories/project_repositories.dart';

class GetDataProjectUsecase {
  final ProjectRepositories repositories;
  GetDataProjectUsecase({
    required this.repositories,
  });

  Future<Either<Failure, List<Project>>> call() async {
    return await repositories.getDataProject();
  }
}
