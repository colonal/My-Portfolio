import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/copyright_datasources.dart';
import '../../domain/entities/copyright.dart';
import '../../domain/repositories/copyright_repositories.dart';

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
