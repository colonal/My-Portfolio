import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/home.dart';
import '../repositories/home_repositories.dart';

class GetDataHomeUsecase {
  final HomeRepositories repositories;
  GetDataHomeUsecase({required this.repositories});
  Future<Either<Failure, Home>> call() async {
    return await repositories.getHomeData();
  }
}
