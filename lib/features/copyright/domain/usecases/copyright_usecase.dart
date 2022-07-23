import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/copyright.dart';
import '../repositories/copyright_repositories.dart';

class CopyRightGetData {
  final CopyRightRepositories repositories;
  CopyRightGetData({
    required this.repositories,
  });

  Future<Either<Failure, Copyright>> call() async {
    return repositories.getData();
  }
}
