import 'package:my_profile/features/certifications/data/datasources/certifications_datasource.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_profile/features/certifications/domain/repositories/certifications_repositories.dart';

class CertificationsRepositoriesImpl extends CertificationsRepositories {
  final CertificationsDataSource dataSource;

  CertificationsRepositoriesImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<Certifications>>> getDataCertifications() async {
    try {
      final List<Certifications> data =
          await dataSource.certificationsgetData();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
