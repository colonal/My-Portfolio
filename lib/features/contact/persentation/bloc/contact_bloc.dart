import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/contact.dart';
import '../../domain/usecases/add_contact.dart';

part 'contact_state.dart';

class ContactBloc extends Cubit<ContactState> {
  final AddContactUsecase addContactUsecase;
  ContactBloc({required this.addContactUsecase}) : super(ContactInitial());

  static ContactBloc get(context) => BlocProvider.of<ContactBloc>(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int onPressed() {
    if (formKey.currentState!.validate()) {
      return 0;
    }
    return -1;
  }

  Future<int> send() async {
    final Contact contact = Contact(
      name: nameController.text,
      email: emailController.text,
      subject: subjectController.text,
      message: messageController.text,
    );

    final either = await addContactUsecase(contact);
    either.fold((failure) {
      emit(ContactErrorState(message: failure.message));
      return 1;
    }, (_) {
      emit(ContactAddState());
      return 0;
    });

    return 0;
  }
}
