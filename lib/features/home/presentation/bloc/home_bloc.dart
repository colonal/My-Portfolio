import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/home.dart';
import '../../domain/usecasee/get_data_home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetDataHomeUsecase getDataHome;
  HomeBloc({required this.getDataHome}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeGetDataEvent) {
        emit(HomeLodingState());

        final either = await getDataHome();

        either.fold(
          (failuer) => emit(HomeFailureDataState(message: failuer.toString())),
          (data) => emit(HomeGgetDataState(data: data)),
        );
      }
    });
  }
}
