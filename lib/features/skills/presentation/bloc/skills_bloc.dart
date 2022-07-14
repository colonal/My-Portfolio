import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:my_profile/features/skills/domin/entites/skills.dart';
import 'package:my_profile/features/skills/domin/usecases/skills_usecases.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final SkillsUsecases usecases;
  SkillsBloc(
    this.usecases,
  ) : super(SkillsInitial()) {
    on<SkillsEvent>((event, emit) async {
      if (event is GetDataSkillsEvent) {
        emit(LoadingSkillsState());
        final either = await usecases();
        either.fold(
          (failuer) => emit(ErrorSkillsState(message: failuer.message)),
          (data) => emit(GetDataSkillsState(data: caverData(data))),
        );
      }
    });
  }

  List<Map<String, List>> caverData(Skills data) {
    List<Map<String, List>> list = [];
    data.skills.forEach((key, vale) {
      list.add({key: vale});
    });
    return list;
  }
}
