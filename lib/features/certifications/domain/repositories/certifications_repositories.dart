import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/certifications.dart';

abstract class CertificationsRepositories {
  Future<Either<Failure, List<Certifications>>> getDataCertifications();
}
