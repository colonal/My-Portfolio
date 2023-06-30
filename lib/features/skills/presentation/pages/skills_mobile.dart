import 'package:flutter/material.dart';
import '../../../../core/widget/helper/count_page.dart';
import '../../../../core/widget/animation/fade_animation.dart';
import '../widget/skills_itme_mobile_widget.dart';

import '../../../../core/widget/helper/title_page.dart';

class SkillsMobile extends StatelessWidget {
  final List<Map<String, List>> data;
  const SkillsMobile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return CountPage(
      countText: "02",
      child: (context, size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              child: const FittedBox(
                fit: BoxFit.cover,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: OpacityAnimation(
                    duration: Duration(seconds: 2),
                    child: TitlePage(
                      title: "My Skills",
                      subTitle: "My Awesome Skills",
                      isCenter: true,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.9,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      data.length,
                      (index) => SizedBox(
                            width: size.width,
                            child: FadeAnimation(
                              offset: Offset(-1.0 * index, 0),
                              duration: const Duration(seconds: 2),
                              child: SkillsItmeMobileWidget(
                                data: data[index],
                                showDivider: data.length - 1 != index,
                                size: size,
                              ),
                            ),
                          )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
