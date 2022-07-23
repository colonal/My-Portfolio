import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/contact.dart';

abstract class ContactRepositories {
  Future<Either<Failure, Unit>> addContact(Contact data);
}
