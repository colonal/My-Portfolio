part of 'skills_bloc.dart';

abstract class SkillsState {}

class SkillsInitial extends SkillsState {}

class GetDataSkillsState extends SkillsState {
  final List<Map<String, List>> data;
  GetDataSkillsState({
    required this.data,
  });
}

class ErrorSkillsState extends SkillsState {
  final String message;
  ErrorSkillsState({
    required this.message,
  });
}

class LoadingSkillsState extends SkillsState {}
