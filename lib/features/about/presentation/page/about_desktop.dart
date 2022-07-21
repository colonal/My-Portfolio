import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/fade_animation.dart';
import 'package:my_profile/core/widget/title_page.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/presentation/widget/about_details_widget_desktop.dart';
import 'package:my_profile/features/about/presentation/widget/image_widget_desktop.dart';

class AboutDesktop extends StatelessWidget {
  final About data;
  const AboutDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CountPage(
      countText: "01",
      child: (context, size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FadeAnimation(
                  offset: const Offset(-1, 0),
                  duration: const Duration(milliseconds: 500),
                  child: ImageWidgetDesktop(img: data.image)),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: FadeAnimation(
                          offset: Offset(10, 0),
                          duration: Duration(seconds: 1),
                          child: TitlePage(
                            title: "About Me",
                            subTitle: "Discver",
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: FadeAnimation(
                          offset: const Offset(15, 0),
                          duration: const Duration(milliseconds: 1500),
                          child: AutoSizeText(
                            data.summary.replaceAll("\\n", "\n\n"),
                            minFontSize: 14,
                            maxFontSize: 30,
                            style: theme.textTheme.headline3,
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: FadeAnimation(
                        offset: const Offset(20, 0),
                        duration: const Duration(seconds: 2),
                        child: SizedBox(
                            height: size.height * 0.2,
                            width: size.width * 0.7,
                            child: AboutDetailsWidget(
                                data: data,
                                size:
                                    Size(size.width * 0.7, size.height * 0.2))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
