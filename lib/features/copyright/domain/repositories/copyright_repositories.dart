import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/copyright.dart';

abstract class CopyRightRepositories {
  Future<Either<Failure, Copyright>> getData();
}
