import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/contact/domain/entities/contact.dart';
import 'package:my_profile/features/contact/domain/repositories/contact_repositories.dart';

class AddContactUsecase {
  final ContactRepositories repositories;
  AddContactUsecase({
    required this.repositories,
  });

  Future<Either<Failure, Unit>> call(Contact data) async {
    return await repositories.addContact(data);
  }
}
