import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';

abstract class CertificationsRepositories {
  Future<Either<Failure, List<Certifications>>> getDataCertifications();
}
