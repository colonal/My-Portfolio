import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/certifications.dart';
import '../repositories/certifications_repositories.dart';

class CertificationsUsecases {
  final CertificationsRepositories repositories;
  CertificationsUsecases({
    required this.repositories,
  });

  Future<Either<Failure, List<Certifications>>> call() async {
    return await repositories.getDataCertifications();
  }
}
