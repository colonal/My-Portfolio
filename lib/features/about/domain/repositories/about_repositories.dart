import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';

abstract class AboutRepositories {
  Future<Either<Failure, About>> getAboutData();
}
