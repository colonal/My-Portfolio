import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/skills/domin/entites/skills.dart';

import '../repositories/skills_repositories.dart';

class SkillsUsecases {
  final SkillsRepositories skillsRepositories;
  SkillsUsecases({
    required this.skillsRepositories,
  });

  Future<Either<Failure, Skills>> call() async {
    return await skillsRepositories.getSkillsData();
  }
}
