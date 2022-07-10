import 'package:dartz/dartz.dart';
import 'package:my_profile/features/home/domain/entities/home.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepositories {
  Future<Either<Failure, Home>> getHomeData();
}
