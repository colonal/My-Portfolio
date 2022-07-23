import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entites/skills.dart';

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
