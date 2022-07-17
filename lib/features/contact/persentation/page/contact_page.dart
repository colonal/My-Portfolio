import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/features/contact/persentation/bloc/contact_bloc.dart';
import 'package:my_profile/features/contact/persentation/page/contact_contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, sate) {
          return const ContentContact();
        },
      ),
    );
  }
}
