import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/features/home/domain/entities/home.dart';
import 'package:my_profile/features/home/domain/usecasee/get_data_home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetDataHomeUsecase getDataHome;
  HomeBloc({required this.getDataHome}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeGetDataEvent) {
        emit(HomeLodingState());
        print("\neither:\n");
        final either = await getDataHome();
        print(either);
        either.fold(
          (failuer) => emit(HomeFailureDataState(message: failuer.toString())),
          (data) => emit(HomeGgetDataState(data: data)),
        );
      }
    });
  }
}
