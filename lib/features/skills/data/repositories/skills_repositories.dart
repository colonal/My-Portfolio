import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/skills_remote_data_source.dart';
import '../../domin/entites/skills.dart';
import '../../domin/repositories/skills_repositories.dart';

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
