import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/about.dart';

abstract class AboutRepositories {
  Future<Either<Failure, About>> getAboutData();
}
