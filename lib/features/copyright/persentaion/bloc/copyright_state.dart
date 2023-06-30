part of 'copyright_bloc.dart';

abstract class CopyrightState {}

class CopyrightInitial extends CopyrightState {}

class CopyrightLoadingState extends CopyrightState {}

class CopyrightGetDataState extends CopyrightState {
  final Copyright data;
  CopyrightGetDataState({
    required this.data,
  });
}

class CopyrightErrorState extends CopyrightState {
  final String message;
  CopyrightErrorState({
    required this.message,
  });
}
