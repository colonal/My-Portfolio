import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/screen_helper.dart';

import '../theme/app_color.dart';

class CountPage extends StatelessWidget {
  final Widget Function(BuildContext, Size) child;
  final String countText;
  const CountPage({required this.child, required this.countText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ScreenHelper.isDesktop(context)
          ? Stack(
              children: [
                FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        width: size.width,
                        height: size.height,
                        child: child(context, size))),
                Positioned(
                  right: 0,
                  top: 30,
                  child: _countWidget(theme, size),
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
                    child: _countWidget(theme, size),
                  ),
                ),
                child(context, Size(size.width, size.height - 40)),
              ],
            ),
    );
  }

  Row _countWidget(ThemeData theme, Size size) {
    return Row(
      children: [
        AutoSizeText(
          countText,
          minFontSize: 14,
          style: theme.textTheme.headline1!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(width: 3),
        Container(
          color: AppColor.textColorDark,
          width: size.width * 0.1,
          height: 5,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
