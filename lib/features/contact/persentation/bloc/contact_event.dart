part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class ContactAddEvent extends ContactEvent {
  final Contact data;
  ContactAddEvent({
    required this.data,
  });
}
