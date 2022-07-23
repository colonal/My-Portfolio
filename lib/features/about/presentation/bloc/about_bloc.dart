import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/about.dart';
import '../../domain/usecases/about_usecases.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final AboutUsecases aboutUsecases;
  AboutBloc({required this.aboutUsecases}) : super(AboutInitial()) {
    on<AboutEvent>((event, emit) async {
      if (event is AboutGetDataEvent) {
        emit(AboutLoadingState());
        final either = await aboutUsecases();
        either.fold((Failure failure) {
          emit(AboutFailuerState(message: failure.toString()));
        }, (data) => emit(AboutGetDataState(data: data)));
      }
    });
  }
}
