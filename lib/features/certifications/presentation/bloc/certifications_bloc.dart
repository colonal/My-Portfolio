import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:my_profile/features/certifications/domain/usecases/certifications_usecases.dart';

import '../../domain/entities/certifications.dart';

part 'certifications_event.dart';
part 'certifications_state.dart';

class CertificationsBloc
    extends Bloc<CertificationsEvent, CertificationsState> {
  final CertificationsUsecases usecases;
  CertificationsBloc({required this.usecases})
      : super(CertificationsInitial()) {
    on<CertificationsEvent>((event, emit) async {
      if (event is CertificationsGetDataEvent) {
        emit(CertificationsLoadingState());

        final either = await usecases();
        either.fold(
            (failure) =>
                emit(CertificationsErrorStete(message: failure.message)),
            (data) => emit(CertificationsGetDataState(data: data)));
      }
    });
  }
}
