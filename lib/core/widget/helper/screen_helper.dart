import 'dart:developer';

import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ScreenHelper({Key? key, required this.desktop, required this.mobile})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;

  static bool isDesktop(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString(), name: "isDesktop");
    if (MediaQuery.of(context).size.width == 0) {
      return true;
    }
    return MediaQuery.of(context).size.width >= 800.0;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          log("constraints: $constraints\nsize:${MediaQuery.of(context).size}",
              name: "constraints");
          if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
            return Container();
          }
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: (constraints.maxWidth >= 800) ? desktop : mobile,
          );
        },
      ),
    );
  }

  Future<double> whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      print("Width:" + value.toString());
      if (value > 0) {
        print("Width > 0: " + value.toString());
        return value;
      }
    }
    // stream exited without a true value, maybe return an exception.
    return 100;
  }
}
