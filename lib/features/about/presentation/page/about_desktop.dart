import 'package:flutter/material.dart';
import '../../../../core/utils/calculate_font_size.dart';
import '../../../../core/widget/helper/count_page.dart';
import '../../../../core/widget/animation/fade_animation.dart';
import '../../../../core/widget/helper/title_page.dart';
import '../../domain/entities/about.dart';
import '../widget/about_details_widget_desktop.dart';
import '../widget/image_widget_desktop.dart';

class AboutDesktop extends StatelessWidget {
  final About data;
  const AboutDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CountPage(
      countText: "01",
      child: (context, size) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: size.width,
            height: size.height,
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
                                subTitle: "Discover",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FadeAnimation(
                            offset: const Offset(15, 0),
                            duration: const Duration(milliseconds: 1000),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      data.summary.replaceAll("\\n", "\n"),
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(
                                              fontSize: calculateFontSize(
                                                  BoxConstraints(maxHeight: constraints.maxHeight-10, maxWidth: constraints.maxWidth-10),
                                                  data.summary
                                                      .replaceAll("\\n", "\n")
                                                      .length)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: FadeAnimation(
                            offset: const Offset(20, 0),
                            duration: const Duration(milliseconds: 1500),
                            child: SizedBox(
                                height: size.height * 0.2,
                                width: size.width * 0.7,
                                child: AboutDetailsWidget(
                                    data: data,
                                    size: Size(
                                        size.width * 0.7, size.height * 0.2))),
                          ),
                        ),
                        SizedBox(height: size.height*.05),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
