import 'package:dartz/dartz.dart';

import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/skills/data/datasources/skills_remote_data_source.dart';
import 'package:my_profile/features/skills/domin/entites/skills.dart';
import 'package:my_profile/features/skills/domin/repositories/skills_repositories.dart';

class SkillsRrepositoriesImpl extends SkillsRepositories {
  final SkillsRemoteDataSource source;
  SkillsRrepositoriesImpl({
    required this.source,
  });

  @override
  Future<Either<Failure, Skills>> getSkillsData() async {
    try {
      return Right(await source.getDataSkills());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
