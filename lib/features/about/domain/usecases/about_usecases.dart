import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/domain/repositories/about_repositories.dart';

class AboutUsecases {
  final AboutRepositories repositories;
  AboutUsecases({
    required this.repositories,
  });

  Future<Either<Failure, About>> call() async {
    return await repositories.getAboutData();
  }
}
