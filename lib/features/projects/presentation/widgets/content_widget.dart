import 'package:flutter/material.dart';

import '../../../../core/widget/helper/count_page.dart';
import '../../../../core/widget/helper/screen_helper.dart';
import '../../../../core/widget/helper/title_page.dart';

class ContentPage extends StatelessWidget {
  final Widget Function(BuildContext, Size) child;
  const ContentPage({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountPage(
      countText: "04",
      child: (context, size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.isDesktop(context) ? 25 : 0),
              alignment: Alignment.topCenter,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: TitlePage(
                  title: "My Projects",
                  subTitle: "Recent Works",
                  isCenter: true,
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.8,
              child: child(context, Size(size.width, size.height * 0.8)),
            ),
          ],
        ),
      ),
    );
  }
}
