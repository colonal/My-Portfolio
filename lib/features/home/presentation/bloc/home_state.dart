part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeGgetDataState extends HomeState {
  final Home data;
  HomeGgetDataState({required this.data});
}

class HomeFailureDataState extends HomeState {
  final String message;
  HomeFailureDataState({
    required this.message,
  });
}
