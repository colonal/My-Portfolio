import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/contact.dart';
import '../repositories/contact_repositories.dart';

class AddContactUsecase {
  final ContactRepositories repositories;
  AddContactUsecase({
    required this.repositories,
  });

  Future<Either<Failure, Unit>> call(Contact data) async {
    return await repositories.addContact(data);
  }
}
