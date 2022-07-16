import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class TitlePage extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isCenter;

  const TitlePage(
      {required this.title,
      required this.subTitle,
      this.isCenter = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          subTitle,
          style:
              theme.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold),
          maxFontSize: theme.textTheme.headline1!.fontSize!,
        ),
        AutoSizeText(
          title,
          style: theme.textTheme.headline1,
          maxFontSize: theme.textTheme.headline1!.fontSize!,
        ),
        Container(
          color: AppColor.textColorDark,
          width: 60,
          height: 1,
        ),
      ],
    );
  }
}
