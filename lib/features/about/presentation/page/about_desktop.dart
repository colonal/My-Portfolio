import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/title_page.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/presentation/widget/about_details_widget.dart';
import 'package:my_profile/features/about/presentation/widget/image_widget_desktop.dart';

class AboutDesktop extends StatelessWidget {
  final About data;
  const AboutDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return CountPage(
      countText: "01",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ImageWidgetDesktop(img: data.image),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitlePage(
                    title: "About Me",
                    subTitle: "Discver",
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: size.height * 0.3,
                    child: AutoSizeText(
                      data.summary.replaceAll("\\n", "\n\n"),
                      minFontSize: 14,
                      style: theme.textTheme.headline3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AboutDetailsWidget(data: data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
