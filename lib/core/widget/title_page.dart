import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class TitlePage extends StatelessWidget {
  final String title;
  final String subTitle;

  const TitlePage({required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          subTitle,
          style:
              theme.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold),
        ),
        AutoSizeText(
          title,
          style: theme.textTheme.headline1,
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
