import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/animation/animation_image_loading.dart';
import '../../../../core/widget/animation/fade_animation.dart';

import '../../../../core/theme/app_color.dart';
import '../../domain/entities/home.dart';

class ContentWidget extends StatelessWidget {
  final Home data;
  final Size imgSize;
  final double widthLine;
  const ContentWidget(
      {required this.data,
      required this.imgSize,
      this.widthLine = 80,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(data.background), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.59),
              Colors.black.withOpacity(0.59),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeAnimation(
                      child: Image.network(
                        data.image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: imgSize.width,
                          height: imgSize.height,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage("assets/images/user.png"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffCBC7BF).withOpacity(0.2),
                                  offset: const Offset(10, 10),
                                  blurRadius: 6,
                                ),
                              ]),
                        ),
                        loadingBuilder: ((context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return Container(
                              width: imgSize.width,
                              height: imgSize.height,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(data.image),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xffCBC7BF)
                                          .withOpacity(0.2),
                                      offset: const Offset(10, 10),
                                      blurRadius: 6,
                                    ),
                                  ]),
                            );
                          }
                          return AnimationImageLoading(
                            width: imgSize.width,
                            height: imgSize.height,
                            isCircle: true,
                            child: Container(
                              width: imgSize.width,
                              height: imgSize.height,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xffCBC7BF)
                                          .withOpacity(0.2),
                                      offset: const Offset(10, 10),
                                      blurRadius: 6,
                                    ),
                                  ]),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 50),
                    FadeAnimation(
                      offset: const Offset(-1, 0),
                      duration: const Duration(milliseconds: 600),
                      child: AutoSizeText(
                        data.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                        minFontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeAnimation(
                      offset: const Offset(-1, 0),
                      duration: const Duration(seconds: 1),
                      child: AutoSizeText(
                        data.career,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3,
                        minFontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // const Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: widthLine,
                      color: AppColor.textColor.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    AutoSizeText(
                      "Scroll Down",
                      minFontSize: 12,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: AppColor.textColor.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
