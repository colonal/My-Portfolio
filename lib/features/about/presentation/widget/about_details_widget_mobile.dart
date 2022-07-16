import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';

import '../../../../core/theme/app_color.dart';
import 'socil_media_widget.dart';

class AboutDetailsWidgetMobile extends StatelessWidget {
  final About data;
  final Size size;
  const AboutDetailsWidgetMobile(
      {required this.data, required this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.textColorDark, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.7,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildText(theme, "Name:", " ${data.name}")),
                Expanded(child: _buildText(theme, "Age:", " ${data.age}")),
                Expanded(child: _buildText(theme, "Phone:", " ${data.phone}")),
                Expanded(
                    child: _buildText(theme, "Address:", " ${data.address}")),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocilMediaWidget(
                  itme: data.socialMedia.facebook,
                  height: size.height * 0.2,
                ),
                SocilMediaWidget(
                  itme: data.socialMedia.linkedin,
                  height: size.height * 0.2,
                ),
                SocilMediaWidget(
                  itme: data.socialMedia.github,
                  height: size.height * 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(ThemeData theme, String title, String text) {
    return AutoSizeText.rich(
      TextSpan(
        text: title,
        children: [
          TextSpan(
            text: text,
            style: theme.textTheme.headline4,
          )
        ],
      ),
      textAlign: TextAlign.start,
      maxFontSize: 16,
      minFontSize: 10,
      style: theme.textTheme.headline4!.copyWith(color: AppColor.textColor),
    );
  }
}
