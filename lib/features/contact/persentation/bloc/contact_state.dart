part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactAddState extends ContactState {}

class ContactErrorState extends ContactState {
  final String message;
  ContactErrorState({
    required this.message,
  });
}
