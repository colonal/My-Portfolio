import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/helper/count_page.dart';
import '../../../../core/widget/animation/fade_animation.dart';
import '../../domain/entities/about.dart';
import '../widget/about_details_widget_mobile.dart';
import '../widget/image_widget_mobil.dart';

class AbouitMobile extends StatelessWidget {
  final About data;
  const AbouitMobile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CountPage(
      countText: "01",
      child: (context, size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          children: [
            FadeAnimation(
              offset: const Offset(-20, 0),
              duration: const Duration(seconds: 1),
              child: SizedBox(
                height: size.height * 0.33,
                child: ImageWidgetMobil(img: data.image, size: size),
              ),
            ),
            FadeAnimation(
              offset: const Offset(20, 0),
              duration: const Duration(seconds: 2),
              child: SizedBox(
                height: size.height * 0.33,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AutoSizeText(
                    data.summary.replaceAll("\\n", "\n\n"),
                    minFontSize: 13,
                    style: theme.textTheme.headline3,
                  ),
                ),
              ),
            ),
            FadeAnimation(
              offset: const Offset(0, 20),
              duration: const Duration(seconds: 3),
              child: SizedBox(
                  height: size.height * 0.33,
                  width: size.width,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: AboutDetailsWidgetMobile(
                      data: data,
                      size: Size(size.width, size.height * 0.3),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
