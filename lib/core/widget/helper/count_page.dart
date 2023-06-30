import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'screen_helper.dart';

import '../../theme/app_color.dart';

class CountPage extends StatelessWidget {
  final Widget Function(BuildContext, Size) child;
  final String countText;
  const CountPage({required this.child, required this.countText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
    log("ScreenHelper",name: ScreenHelper.isDesktop(context).toString());
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: ScreenHelper.isDesktop(context)
              ? Stack(
                  children: [
                    FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            child: child(context, Size(constraints.maxWidth, constraints.maxHeight)))),
                    Positioned(
                      right: 0,
                      top: 30,
                      child: _countWidget(theme, constraints),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: 30,
                      alignment: AlignmentDirectional.centerEnd,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerEnd,
                        child: _countWidget(theme, constraints),
                      ),
                    ),
                    child(context, Size(constraints.maxWidth, constraints.maxHeight - 40)),
                  ],
                ),
        );
      }
    );
  }

  Row _countWidget(ThemeData theme,BoxConstraints constraints) {
    return Row(
      children: [
        AutoSizeText(
          countText,
          minFontSize: 14,
          style: theme.textTheme.displayLarge!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(width: 3),
        Container(
          color: AppColor.textColorDark,
          width: constraints.maxWidth * 0.1,
          height: 5,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
