import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/projects/domain/entities/project.dart';

abstract class ProjectRepositories {
  Future<Either<Failure, List<Project>>> getDataProject();
}
