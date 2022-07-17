import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/features/contact/domain/entities/contact.dart';
import 'package:my_profile/features/contact/domain/usecases/add_contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final AddContactUsecase addContactUsecase;
  ContactBloc({required this.addContactUsecase}) : super(ContactInitial()) {
    on<ContactEvent>(
      (event, emit) async {
        if (event is ContactAddEvent) {
          final either = await addContactUsecase(event.data);
          either.fold(
              (failure) => emit(ContactErrorState(message: failure.message)),
              (_) => emit(ContactAddState()));
        }
      },
    );
  }

  static ContactBloc get(context) => BlocProvider.of<ContactBloc>(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void Function()? onPressed() {
    if (formKey.currentState!.validate()) {}
    return null;
  }
}
