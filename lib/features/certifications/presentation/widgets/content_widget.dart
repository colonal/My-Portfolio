import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/screen_helper.dart';

import '../../../../core/widget/title_page.dart';
import '../../domain/entities/certifications.dart';

class ContentWidget extends StatelessWidget {
  final List<Certifications> data;
  final Widget child;
  const ContentWidget({required this.data, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountPage(
      countText: "03",
      child: (context, size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.isDesktop(context) ? 25 : 0),
              alignment: Alignment.center,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: TitlePage(
                  title: "Certifications",
                  subTitle: "My Certifications",
                  isCenter: true,
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height * 0.8,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
