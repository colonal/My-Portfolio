import 'package:flutter/material.dart';
import 'package:my_profile/features/about/presentation/widget/animation_image_loading.dart';

import '../../../../core/widget/title_page.dart';

class ImageWidgetMobil extends StatelessWidget {
  final String img;
  const ImageWidgetMobil({required this.img, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Image.network(
      img,
      fit: BoxFit.fitWidth,
      alignment: const FractionalOffset(1, 0.1),
      filterQuality: FilterQuality.low,
      scale: 1.5,
      loadingBuilder: ((context, child, loadingProgress) {
        if (loadingProgress == null) {
          return Stack(
            children: [
              Container(
                height: size.height * 0.30,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.primaryColorDark, width: 10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                width: double.infinity,
                child: child,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                  ]),
                ),
                child: Container(
                  height: size.height * 0.30,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(25),
                  child: const TitlePage(
                    title: "About Me",
                    subTitle: "Discver",
                  ),
                ),
              ),
            ],
          );
        }
        return AnimationImageLoading(
          width: double.infinity,
          height: size.height * 0.30,
          child: Container(
            height: size.height * 0.30,
            decoration: BoxDecoration(
              border: Border.all(color: theme.primaryColorDark, width: 10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            width: double.infinity,
            child: child,
          ),
        );
      }),
    );
  }
}