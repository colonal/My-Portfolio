import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_profile/features/projects/domain/entities/project.dart';
import 'package:my_profile/features/projects/domain/usecasee/get_data_project_usecase.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetDataProjectUsecase usecase;
  ProjectBloc({required this.usecase}) : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) async {
      if (event is ProjectGetDataEvent) {
        emit(ProjectLoadingState());
        final either = await usecase();
        either.fold(
          (failuer) => emit(ProjectErrorState(failuer.message)),
          (data) => emit(ProjectGetDataState(data)),
        );
      }
    });
  }
}
