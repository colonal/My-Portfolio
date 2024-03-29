import 'package:flutter/material.dart';
import '../../../../core/widget/animation/animation_image_loading.dart';

import '../../../../core/widget/helper/title_page.dart';

class ImageWidgetMobil extends StatelessWidget {
  final String img;
  final Widget? child;
  const ImageWidgetMobil({required this.img,this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraint) {
        return Image.network(
          img,
          fit: BoxFit.fitWidth,
          alignment: const FractionalOffset(1, 0.1),
          filterQuality: FilterQuality.low,
          scale: 1.5,
          errorBuilder: (_, __, ___) {
            return _buildStyleImage(constraint: constraint, theme: theme,child: child);
          },
          loadingBuilder: ((context, child, loadingProgress) {
            if (loadingProgress == null) {
              return _buildStyleImage(constraint: constraint, theme: theme, child: child);
            }
            return AnimationImageLoading(
              width: double.infinity,
              height: constraint.maxHeight ,
              child: Container(
                width: double.infinity,
                height: constraint.maxHeight,
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

                // child: child,
              ),
            );
          }),
        );
      }
    );
  }
}

_buildStyleImage(
    {required BoxConstraints constraint, required ThemeData theme,  Widget? child}) {
  return Stack(
    children: [
      Container(
        height: constraint.maxHeight ,
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
        child: child ?? Container(),
      ),
      Container(
        height: constraint.maxHeight ,
        width: double.infinity,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.6),
          ]),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(25),
            child: const TitlePage(
              title: "About Me",
              subTitle: "Discover",
            ),
          ),
        ),
      ),
    ],
  );
}
