import 'package:flutter/material.dart';

import 'package:my_profile/core/widget/animation_image_loading.dart';

class ImageWidgetDesktop extends StatelessWidget {
  final String img;
  const ImageWidgetDesktop({required this.img, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Center(
        child: Image.network(
          img,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.low,
          errorBuilder: (_, __, ___) {
            return FittedBox(
              fit: BoxFit.contain,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                  color: theme.primaryColorDark,
                  border: Border.all(color: theme.primaryColorDark, width: 15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Container(),
              ),
            );
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    color: theme.primaryColorDark,
                    border:
                        Border.all(color: theme.primaryColorDark, width: 15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: child,
                ),
              );
            }
            return Center(
              child: AnimationImageLoading(
                height: size.height * 0.6,
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: size.height * 0.6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.primaryColorDark,
                    border:
                        Border.all(color: theme.primaryColorDark, width: 15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
