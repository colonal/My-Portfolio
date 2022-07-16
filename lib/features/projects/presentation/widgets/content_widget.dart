import 'package:flutter/material.dart';

import '../../../../core/widget/count_page.dart';
import '../../../../core/widget/title_page.dart';
import '../../domain/entities/project.dart';

class ContentPage extends StatelessWidget {
  final List<Project> data;
  final Widget child;
  const ContentPage({required this.data, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CountPage(
      countText: "03",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              alignment: Alignment.topCenter,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: TitlePage(
                  title: "Certifications",
                  subTitle: "My Certifications",
                  isCenter: true,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: size.width,
              height: size.height * 0.7,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
