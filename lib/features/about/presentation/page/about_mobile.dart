import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/presentation/widget/image_widget_mobil.dart';

import '../widget/about_details_widget.dart';

class AbouitMobile extends StatelessWidget {
  final About data;
  const AbouitMobile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CountPage(
      countText: "01",
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ImageWidgetMobil(img: data.image),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        data.summary.replaceAll("\\n", "\n\n"),
                        minFontSize: 13,
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(flex: 1, child: AboutDetailsWidget(data: data)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
