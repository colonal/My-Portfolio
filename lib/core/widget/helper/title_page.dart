import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

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
        Text(
          subTitle,
          style:
              theme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: theme.textTheme.displayLarge,
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
