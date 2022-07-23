import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ScreenHelper({Key? key, required this.desktop, required this.mobile})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: (constraints.maxWidth >= 800) ? desktop : mobile,
        );
      },
    );
  }
}
