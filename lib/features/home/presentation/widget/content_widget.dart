import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
    print("");
    print((size.width).toString() + "  " + imgSize.width.toString());
    print((size.height).toString() + "  " + imgSize.height.toString());
    print(imgSize);
    print("");
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                        color: const Color(0xffCBC7BF).withOpacity(0.2),
                        offset: const Offset(10, 10),
                        blurRadius: 6,
                      ),
                    ]),
              ),
              const SizedBox(height: 50),
              AutoSizeText(
                data.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
                minFontSize: 16,
              ),
              const SizedBox(height: 30),
              AutoSizeText(
                data.career,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
                minFontSize: 14,
              ),
              const Spacer(),
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
