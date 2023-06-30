import 'package:flutter/material.dart';

import '../../../../core/widget/animation/fade_animation.dart';
import '../../domain/entities/copyright.dart';
import '../widget/socialmedia_itme_widget.dart';

class ContentContact extends StatelessWidget {
  final Copyright data;
  const ContentContact({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        height: 150,
        width: size.width / 0.5,
        color: theme.primaryColor,
        child: FadeAnimation(
          offset: const Offset(0, 2),
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.socialMedia.length,
                      (index) => SocialmediaItmeWidget(
                        socialMedia: data.socialMedia[index],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: data.messages,
                      style: theme.textTheme.labelSmall,
                      children: [
                        TextSpan(
                          text: " ${data.name}",
                          style: theme.textTheme.labelSmall!.copyWith(
                            color: theme.textTheme.displayLarge!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
