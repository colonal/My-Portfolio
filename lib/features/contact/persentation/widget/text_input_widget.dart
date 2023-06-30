import 'package:flutter/material.dart';
import '../../../../core/widget/helper/screen_helper.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool multiLine;
  final TextInputType textInputType;
  final Size size;
  const TextInputWidget(
      {required this.controller,
      required this.hintText,
      required this.size,
      this.textInputType = TextInputType.text,
      this.multiLine = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    return Expanded(
      child: SizedBox(
        width: isDesktop
            ? size.width * 0.5
            : size.width * 0.8,
        child:TextFormField(
          keyboardType: TextInputType.multiline,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: 18,
              ),
          controller: controller,
          cursorColor: Theme.of(context).cardColor,
          minLines: multiLine ? 6 : null,
          maxLines: multiLine ? 6 : 1,
          validator: (String? val) {
            if (textInputType == TextInputType.emailAddress) {
              return _emailValidator(val) ? null : "Enter Valid Email";
            }
            return val!.isEmpty ? "$hintText Can't be empty" : null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).cardColor,
                width: 1.1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
                width: 1.1,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).cardColor,
                width: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _emailValidator(text) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(text);
  }
}
