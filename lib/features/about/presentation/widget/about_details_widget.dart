import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';

import '../../../../core/theme/app_color.dart';
import 'socil_media_widget.dart';

class AboutDetailsWidget extends StatelessWidget {
  final About data;
  const AboutDetailsWidget({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    bool isDesktop = ScreenHelper.isDesktop(context);
    List<Widget> nameAndAge = [
      _buildText(theme, "Name:", " ${data.name}"),
      SizedBox(height: isDesktop ? 0 : 10),
      _buildText(theme, "Age:", " ${data.age}"),
    ];

    List<Widget> phoneAndAddress = [
      _buildText(theme, "Phone:", " ${data.phone}"),
      SizedBox(height: isDesktop ? 0 : 10),
      _buildText(theme, "Address:", " ${data.address}"),
    ];

    return Container(
      width: isDesktop ? size.width * 0.7 : null,
      padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: isDesktop ? 25 : 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.textColorDark),
      ),
      child: 1 == 2
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isDesktop)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: nameAndAge[0]),
                      Expanded(child: nameAndAge[2]),
                    ],
                  ),
                if (!isDesktop) ...nameAndAge,
                SizedBox(height: isDesktop ? 30 : 10),
                if (isDesktop)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: phoneAndAddress[0],
                      ),
                      Expanded(
                        child: phoneAndAddress[2],
                      ),
                    ],
                  ),
                if (!isDesktop) ...phoneAndAddress,
                SizedBox(height: isDesktop ? 30 : 10),
                if (1 == 1)
                  Row(
                    children: [
                      Expanded(
                        child: SocilMediaWidget(
                          itme: data.socialMedia.facebook,
                        ),
                      ),
                      Expanded(
                        child: SocilMediaWidget(
                          itme: data.socialMedia.linkedin,
                        ),
                      ),
                      Expanded(
                        child: SocilMediaWidget(
                          itme: data.socialMedia.github,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }

  Container _buildText(ThemeData theme, String title, String text) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: AutoSizeText.rich(
        TextSpan(text: title, children: [
          TextSpan(
            text: text,
            style: theme.textTheme.headline4,
          )
        ]),
        textAlign: TextAlign.start,
        maxFontSize: 16,
        style: theme.textTheme.headline4!.copyWith(color: AppColor.textColor),
      ),
    );
  }
}
