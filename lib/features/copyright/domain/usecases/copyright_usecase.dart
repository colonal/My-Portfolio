import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/copyright/domain/entities/copyright.dart';
import 'package:my_profile/features/copyright/domain/repositories/copyright_repositories.dart';

class CopyRightGetData {
  final CopyRightRepositories repositories;
  CopyRightGetData({
    required this.repositories,
  });

  Future<Either<Failure, Copyright>> call() async {
    return repositories.getData();
  }
}
