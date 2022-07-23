import 'package:dartz/dartz.dart';
import '../entities/home.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepositories {
  Future<Either<Failure, Home>> getHomeData();
}
