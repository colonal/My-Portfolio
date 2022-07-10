abstract class Failure {}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message});
}

class EmptyCacheFailure extends Failure {}
