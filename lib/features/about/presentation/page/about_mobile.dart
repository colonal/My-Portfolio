import 'package:flutter/material.dart';
import '../../../../core/utils/calculate_font_size.dart';
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
      child: (context, size) => SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              FadeAnimation(
                offset: const Offset(-20, 0),
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: size.height * 0.2,
                  child: ImageWidgetMobil(img: data.image),
                ),
              ),
              Expanded(
                child: FadeAnimation(
                  offset: const Offset(20, 0),
                  duration: const Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            data.summary.replaceAll("\\n", "\n"),
                            style: theme.textTheme.displaySmall!.copyWith(
                                fontSize: calculateFontSize(constraints,
                                    data.summary.replaceAll("\\n", "\n").length)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                offset: const Offset(0, 20),
                duration: const Duration(milliseconds: 1500),
                child: SizedBox(
                    height: size.height * 0.2,
                    width: size.width,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: AboutDetailsWidgetMobile(
                        data: data,
                        size: Size(size.width, size.height * 0.2),
                      ),
                    )),
              ),
              SizedBox(height: size.height*.025),
            ],
          ),
        ),
      ),
    );
  }

  
}
