part of 'project_bloc.dart';

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoadingState extends ProjectState {}

class ProjectGetDataState extends ProjectState {
  final List<Project> data;

  ProjectGetDataState(this.data);
}

class ProjectErrorState extends ProjectState {
  final String message;

  ProjectErrorState(this.message);
}
