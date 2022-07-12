part of 'about_bloc.dart';

abstract class AboutState {}

class AboutInitial extends AboutState {}

class AboutLoadingState extends AboutState {}

class AboutGetDataState extends AboutState {
  final About data;
  AboutGetDataState({
    required this.data,
  });
}

class AboutFailuerState extends AboutState {
  final String message;
  AboutFailuerState({
    required this.message,
  });
}
