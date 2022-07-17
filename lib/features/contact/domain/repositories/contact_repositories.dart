import 'package:dartz/dartz.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/contact/domain/entities/contact.dart';

abstract class ContactRepositories {
  Future<Either<Failure, Unit>> addContact(Contact data);
}
