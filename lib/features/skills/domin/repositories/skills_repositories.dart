import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/skills/domin/entites/skills.dart';

abstract class SkillsRepositories {
  Future<Either<Failure, Skills>> getSkillsData();
}
