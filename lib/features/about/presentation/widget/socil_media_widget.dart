import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../../../../core/widget/animation/animation_icon.dart';
import '../../../../core/widget/helper/screen_helper.dart';
import '../../domain/entities/social_media.dart';
import 'package:url_launcher/url_launcher.dart';

class SocilMediaWidget extends StatelessWidget {
  final SocialMediaItme itme;
  final Size size;
  const SocilMediaWidget({required this.itme, required this.size, super.key});

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
              height: size.height * 0.8,
              width: size.height * 0.8,
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
                      style: theme.textTheme.labelSmall!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
