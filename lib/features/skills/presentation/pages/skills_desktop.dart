import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/title_page.dart';
import 'package:my_profile/features/skills/presentation/widget/Skills_itme_desktop_widget.dart';

class SkillsDesktop extends StatelessWidget {
  final List<Map<String, List>> data;
  const SkillsDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountPage(
      countText: "02",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitlePage(
              title: "My Skills",
              subTitle: "My Awesome Skills",
              isCenter: true,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  data.length,
                  (index) => SkillsItmeDesktopWidget(data: data[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
