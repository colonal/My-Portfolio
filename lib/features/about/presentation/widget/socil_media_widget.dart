import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/utils/snackbar_message.dart';
import 'package:my_profile/core/widget/animation_icon.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/about/domain/entities/social_media.dart';
import 'package:url_launcher/url_launcher.dart';

class SocilMediaWidget extends StatelessWidget {
  final SocialMediaItme itme;
  final double height;
  const SocilMediaWidget({required this.itme, this.height = 0, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnimationIcon(
      onTap: () async {
        try {
          final Uri url = Uri.parse(itme.url);
          if (!await launchUrl(url)) throw 'Could not launch $url';
        } catch (e) {
          SnakBarMessage.showErrorSnackBar(
              message: e.toString(), context: context);
        }
      },
      child: ScreenHelper.isMobile(context)
          ? Container(
              height: height * 0.8,
              width: height * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(itme.icon))),
            )
          : Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(itme.icon),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 20,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      itme.name,
                      minFontSize: 5,
                      maxFontSize: 15,
                      style: theme.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
