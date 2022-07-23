import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/contact_remote_data_sources.dart';
import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repositories.dart';

class ContactRepositoriesImpl extends ContactRepositories {
  final ContactRemoteDataSource dataSource;
  ContactRepositoriesImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, Unit>> addContact(Contact data) async {
    try {
      return Right(await dataSource.addContact(data));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
