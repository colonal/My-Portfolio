import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../bloc/contact_bloc.dart';
import 'contact_contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (ctx, sate) {
          if (sate is ContactErrorState) {
            SnakBarMessage.showErrorSnackBar(
                message: sate.message, context: context);
          }
          return const ContentContact();
        },
      ),
    );
  }
}
