import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/about.dart';
import '../repositories/about_repositories.dart';

class AboutUsecases {
  final AboutRepositories repositories;
  AboutUsecases({
    required this.repositories,
  });

  Future<Either<Failure, About>> call() async {
    return await repositories.getAboutData();
  }
}
