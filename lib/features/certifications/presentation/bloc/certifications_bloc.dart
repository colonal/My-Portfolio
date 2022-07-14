import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'certifications_event.dart';
part 'certifications_state.dart';

class CertificationsBloc extends Bloc<CertificationsEvent, CertificationsState> {
  CertificationsBloc() : super(CertificationsInitial()) {
    on<CertificationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
