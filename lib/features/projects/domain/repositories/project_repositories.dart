import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/project.dart';

abstract class ProjectRepositories {
  Future<Either<Failure, List<Project>>> getDataProject();
}
