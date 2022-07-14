import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:my_profile/features/certifications/domain/repositories/certifications_repositories.dart';

class CertificationsUsecases {
  final CertificationsRepositories repositories;
  CertificationsUsecases({
    required this.repositories,
  });

  Future<Either<Failure, List<Certifications>>> call() async {
    return await repositories.getDataCertifications();
  }
}
