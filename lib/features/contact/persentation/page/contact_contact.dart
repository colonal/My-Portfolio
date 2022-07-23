import 'package:flutter/material.dart';
import '../../../../core/widget/helper/screen_helper.dart';
import '../widget/form_submit_btn.dart';
import '../widget/text_input_widget.dart';

import '../../../../core/widget/helper/count_page.dart';
import '../../../../core/widget/helper/title_page.dart';
import '../bloc/contact_bloc.dart';

class ContentContact extends StatelessWidget {
  const ContentContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactBloc bloc = ContactBloc.get(context);
    return CountPage(
      countText: "05",
      child: (context, size) => SizedBox(
        height: size.height,
        child: Column(
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
            Expanded(
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
                    const Expanded(child: FormSubmitBtn()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
