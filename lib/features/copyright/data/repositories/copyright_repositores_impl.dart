import 'package:dartz/dartz.dart';

import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/copyright/data/datasources/copyright_datasources.dart';
import 'package:my_profile/features/copyright/domain/entities/copyright.dart';
import 'package:my_profile/features/copyright/domain/repositories/copyright_repositories.dart';

class CopyrightRepositoresImpl extends CopyRightRepositories {
  final CopyrightDatasources datasources;
  CopyrightRepositoresImpl({
    required this.datasources,
  });
  @override
  Future<Either<Failure, Copyright>> getData() async {
    try {
      return Right(await datasources.getData());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
