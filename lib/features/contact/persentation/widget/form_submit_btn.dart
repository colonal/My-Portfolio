import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/contact/persentation/bloc/contact_bloc.dart';

class FormSubmitBtn extends StatelessWidget {
  const FormSubmitBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        height: isDesktop ? 50 : 30,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Theme.of(context).textTheme.headline1!.color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).textTheme.headline1!.color!,
              width: 2,
            )),
        child: MaterialButton(
          onPressed: ContactBloc.get(context).onPressed,
          minWidth: isDesktop ? 200 : 150,
          hoverColor: Theme.of(context).primaryColorDark,
          child: Text(
            "SEND MESSAGE",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isDesktop ? 16 : 12,
                ),
          ),
        ),
      ),
    );
  }
}
