import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/features/contact/persentation/bloc/contact_bloc.dart';
import 'package:my_profile/features/contact/persentation/widget/form_submit_btn.dart';
import 'package:my_profile/features/contact/persentation/widget/text_input_widget.dart';

import '../../../../core/widget/screen_helper.dart';
import '../../../../core/widget/title_page.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactBloc bloc = ContactBloc.get(context);
    return CountPage(
      countText: "05",
      child: (context, size) => Column(
        children: [
          Container(
            height: size.height * 0.2,
            padding: EdgeInsets.symmetric(
                vertical: ScreenHelper.isDesktop(context) ? 25 : 0),
            alignment: Alignment.center,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: TitlePage(
                title: "Get In Touch",
                subTitle: "Contact My",
                isCenter: true,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Form(
              key: bloc.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextInputWidget(
                    controller: bloc.nameController,
                    hintText: "Name",
                  ),
                  TextInputWidget(
                    controller: bloc.emailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  TextInputWidget(
                    controller: bloc.subjectController,
                    hintText: "Subject",
                  ),
                  TextInputWidget(
                    controller: bloc.messageController,
                    hintText: "Your Message",
                    textInputType: TextInputType.multiline,
                    multiLine: true,
                  ),
                  const FormSubmitBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
