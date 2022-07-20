import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/copyright/domain/entities/copyright.dart';

abstract class CopyRightRepositories {
  Future<Either<Failure, Copyright>> getData();
}
