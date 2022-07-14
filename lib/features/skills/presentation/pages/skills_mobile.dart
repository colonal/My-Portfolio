import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/features/skills/presentation/widget/skills_itme_mobile_widget.dart';

import '../../../../core/widget/title_page.dart';

class SkillsMobile extends StatelessWidget {
  final List<Map<String, List>> data;
  const SkillsMobile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return CountPage(
      countText: "02",
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              const TitlePage(
                title: "My Skills",
                subTitle: "My Awesome Skills",
                isCenter: true,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      data.length,
                      (index) => SkillsItmeMobileWidget(
                          data: data[index],
                          showDivider: data.length - 1 != index)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
