import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:math' as math;

class ScreenHelper extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  static double size = 800;

  const ScreenHelper({Key? key, required this.desktop, required this.mobile})
      : super(key: key);

  static bool isMobile(BuildContext context) {
    
     Size size = _getSize(context);
    log((size.width < 800.0).toString(),
        name: "isMobile");
    return  size.width < 800.0;
  }

  static bool isDesktop(BuildContext context) {
    Size size = _getSize(context);
    log(size.width.toString(), name: "isDesktop");
    return size.width >= 800.0;
  }

  

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          log(constraints.toString(), name: "ScreenHelper");
          Size size = _getSize(context);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: (size.width >= 800) ? desktop : mobile,
          );
        },
      ),
    );
  }

  static Size _getSize(BuildContext context) {
    late Size size;
    if (kIsWeb) {
      final width = math.max(
          (document.documentElement?.clientWidth ?? 0).toDouble(),
          window.innerWidth!.toDouble());
      final height = math.max(
          (document.documentElement?.clientHeight ?? 0).toDouble(),
          window.innerHeight!.toDouble());
      
      size = Size(
        width,
        height,
      );
    } else {
      size = MediaQuery.of(context).size;
    }
    log(size.toString(), name: "_getSize");
    return size;
  }
}
