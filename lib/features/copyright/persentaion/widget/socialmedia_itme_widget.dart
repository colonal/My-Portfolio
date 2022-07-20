import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/social_madia.dart';
import 'dart:math' as math;

class SocialmediaItmeWidget extends StatefulWidget {
  final SocialMedia socialMedia;
  const SocialmediaItmeWidget({required this.socialMedia, Key? key})
      : super(key: key);

  @override
  State<SocialmediaItmeWidget> createState() => _SocialmediaItmeWidgetState();
}

class _SocialmediaItmeWidgetState extends State<SocialmediaItmeWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 1, end: 360)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () async {
          try {
            final Uri url = Uri.parse(widget.socialMedia.url);
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          } catch (e) {
            SnakBarMessage.showErrorSnackBar(
                message: e.toString(), context: context);
          }
        },
        onHover: (valu) {
          if (valu) {
            controller.forward();
          } else {
            controller.reverse();
          }
        },
        child: AnimatedBuilder(
            animation: animation,
            child: Image.network(widget.socialMedia.icon),
            builder: (context, child) {
              return Transform.scale(
                scale: ((animation.value * (1 / 360)) + 1) > 1.6
                    ? 1.5
                    : (animation.value * (1 / 360)) + 1,
                child: Transform.rotate(
                  angle: animation.value * (math.pi / 180),
                  child: Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: theme.hintColor),
                    ),
                    child: child,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
