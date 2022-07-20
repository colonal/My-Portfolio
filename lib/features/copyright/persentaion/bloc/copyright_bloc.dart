import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_profile/features/copyright/domain/entities/copyright.dart';
import 'package:my_profile/features/copyright/domain/usecases/copyright_usecase.dart';

part 'copyright_event.dart';
part 'copyright_state.dart';

class CopyrightBloc extends Bloc<CopyrightEvent, CopyrightState> {
  final CopyRightGetData getData;
  CopyrightBloc({required this.getData}) : super(CopyrightInitial()) {
    on<CopyrightEvent>((event, emit) async {
      if (event is CopyRightGetDataEvent) {
        final either = await getData();

        either.fold(
          (failure) => emit(CopyrightErrorState(message: failure.message)),
          (data) => emit(CopyrightGetDataState(data: data)),
        );
      }
    });
  }
}
