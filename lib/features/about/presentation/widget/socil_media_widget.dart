import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/utils/snackbar_message.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/about/domain/entities/social_media.dart';
import 'package:url_launcher/url_launcher.dart';

class SocilMediaWidget extends StatelessWidget {
  final SocialMediaItme itme;
  const SocilMediaWidget({required this.itme, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return InkWell(
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
          ? FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(itme.icon),
                    maxRadius: (size.width > 285) ? 12 : 10,
                    minRadius: 3,
                  ),
                ],
              ),
            )
          : Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(itme.icon),
                  maxRadius: 14,
                  minRadius: 3,
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
