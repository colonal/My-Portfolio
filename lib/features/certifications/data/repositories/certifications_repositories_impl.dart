import '../datasources/certifications_datasource.dart';
import '../../domain/entities/certifications.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/certifications_repositories.dart';

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
