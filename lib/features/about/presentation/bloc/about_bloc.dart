import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/error/failure.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/domain/usecases/about_usecases.dart';

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
          print("About error : ${failure.message}");
          emit(AboutFailuerState(message: failure.toString()));
        }, (data) => emit(AboutGetDataState(data: data)));
      }
    });
  }
}
