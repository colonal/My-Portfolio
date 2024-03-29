import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../core/widget/helper/count_page.dart';
import '../../../../core/widget/animation/fade_animation.dart';
import '../../../../core/widget/helper/title_page.dart';
import '../widget/Skills_itme_desktop_widget.dart';

class SkillsDesktop extends StatelessWidget {
  final List<Map<String, List>> data;
  const SkillsDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("data: ${data[0]}", name: "data");
    return CountPage(
      countText: "02",
      child: (context, size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OpacityAnimation(
              duration: Duration(seconds: 2),
              child: TitlePage(
                title: "My Skills",
                subTitle: "My Awesome Skills",
                isCenter: true,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    data.length,
                    (index) => FadeAnimation(
                        offset: Offset(-1.0 * index, 0),
                        duration: const Duration(seconds: 2),
                        child: Container(
                          
                            alignment: Alignment.topCenter,
                            child: SkillsItmeDesktopWidget(data: data[index], size:size))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
