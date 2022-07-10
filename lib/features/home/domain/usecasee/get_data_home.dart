import 'package:dartz/dartz.dart';
import 'package:my_profile/features/home/domain/repositories/home_repositories.dart';

import '../../../../core/error/failure.dart';
import '../entities/home.dart';

class GetDataHomeUsecase {
  final HomeRepositories repositories;
  GetDataHomeUsecase({required this.repositories});
  Future<Either<Failure, Home>> call() async {
    return await repositories.getHomeData();
  }
}
