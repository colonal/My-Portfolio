import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/about.dart';

import '../../../../core/theme/app_color.dart';
import 'socil_media_widget.dart';

class AboutDetailsWidget extends StatelessWidget {
  final About data;
  final Size size;
  const AboutDetailsWidget({required this.data, required this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.textColorDark, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.6,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            width: size.width,
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.6 * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildText(theme, "Name:", " ${data.name}"),
                      ),
                      Expanded(
                        child: _buildText(theme, "Age:", " ${data.age}"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.6 * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildText(theme, "Phone:", " ${data.phone}"),
                      ),
                      Expanded(
                        child:
                            _buildText(theme, "Address:", " ${data.address}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocilMediaWidget(
                    itme: data.socialMedia.facebook,
                    size:size,
                  ),
                  SocilMediaWidget(
                    itme: data.socialMedia.linkedin,
                    size:size,
                  ),
                  SocilMediaWidget(
                    itme: data.socialMedia.github,
                    size:size,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(ThemeData theme, String title, String text) {
    return AutoSizeText.rich(
      TextSpan(text: title, children: [
        TextSpan(
          text: text,
          style: theme.textTheme.headlineSmall,
        )
      ]),
      textAlign: TextAlign.start,
      maxFontSize: 20,
      minFontSize: 10,
      style: theme.textTheme.headlineSmall!.copyWith(color: AppColor.textColor),
    );
  }
}
