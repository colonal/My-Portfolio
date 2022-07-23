import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entites/skills.dart';

abstract class SkillsRepositories {
  Future<Either<Failure, Skills>> getSkillsData();
}
