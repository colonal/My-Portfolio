import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/snackbar_message.dart';
import '../../../../core/widget/animation/animation_icon.dart';
import '../../domain/entities/social_madia.dart';

class SocialmediaItmeWidget extends StatelessWidget {
  final SocialMedia socialMedia;
  const SocialmediaItmeWidget({required this.socialMedia, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimationIcon(
        child: Container(
          height: 50,
          width: 50,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: theme.hintColor),
          ),
          child: Image.network(
            socialMedia.icon,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/social-media.png");
            },
          ),
        ),
        onTap: () async {
          try {
            final Uri url = Uri.parse(socialMedia.url);
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          } catch (e) {
            SnakBarMessage.showErrorSnackBar(
                message: e.toString(), context: context);
          }
        },
      ),
    );
  }
}
