import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool multiLine;
  final bool isDesktop;
  final TextInputType textInputType;
  const TextInputWidget(
      {required this.controller,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.isDesktop = true,
      this.multiLine = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: isDesktop
            ? MediaQuery.of(context).size.width * 0.5
            : MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          style: Theme.of(context).textTheme.headline6!.copyWith(
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
            hintStyle: Theme.of(context).textTheme.headline6,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).cardColor,
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
