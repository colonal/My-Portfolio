import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/theme/app_color.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';
import 'package:my_profile/features/about/domain/entities/social_media.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDesktop extends StatelessWidget {
  final About data;
  const AboutDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Center(
                        child: Image.network(
                      data.image,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.low,
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
                                border: Border.all(
                                    color: theme.primaryColorDark, width: 15),
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
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: size.height * 0.6,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: theme.primaryColorDark,
                              border: Border.all(
                                  color: theme.primaryColorDark, width: 15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Discver",
                        style: theme.textTheme.headline3!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        "About",
                        style: theme.textTheme.headline1,
                      ),
                      Container(
                        color: AppColor.textColorDark,
                        width: 60,
                        height: 1,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: size.height * 0.3,
                        child: AutoSizeText(
                          data.summary.replaceAll("\\n", "\n\n"),
                          minFontSize: 14,
                          style: theme.textTheme.headline3,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: size.width * 0.7,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.textColorDark),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    "Name: ${data.name}",
                                    minFontSize: 14,
                                    style: theme.textTheme.headline6,
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    "Age: ${data.age}",
                                    minFontSize: 16,
                                    style: theme.textTheme.headline6,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    "Phone: ${data.phone}",
                                    minFontSize: 16,
                                    style: theme.textTheme.headline6,
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    "Address: ${data.address}",
                                    minFontSize: 16,
                                    style: theme.textTheme.headline6,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            if (1 == 1)
                              Row(
                                children: [
                                  Expanded(
                                    child: buildSocialMediaItme(
                                        theme: theme,
                                        size: size,
                                        itme: data.socialMedia.facebook),
                                  ),
                                  Expanded(
                                    child: buildSocialMediaItme(
                                        theme: theme,
                                        size: size,
                                        itme: data.socialMedia.linkedin),
                                  ),
                                  Expanded(
                                    child: buildSocialMediaItme(
                                        theme: theme,
                                        size: size,
                                        itme: data.socialMedia.github),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 30,
            child: Row(
              children: [
                AutoSizeText(
                  "01",
                  minFontSize: 14,
                  style: theme.textTheme.headline1!
                      .copyWith(color: theme.primaryColorLight),
                ),
                const SizedBox(width: 3),
                Container(
                  color: AppColor.textColorDark,
                  width: 100,
                  height: 5,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialMediaItme(
      {required ThemeData theme,
      required Size size,
      required SocialMediaItme itme}) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(itme.url);
        if (!await launchUrl(url)) throw 'Could not launch $url';
      },
      child: size.width < 900 && 1 == 1
          ? Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(itme.icon),
                  maxRadius: 14,
                  minRadius: 3,
                ),
                const SizedBox(height: 5),
                AutoSizeText(
                  itme.name,
                  minFontSize: 5,
                  maxFontSize: 15,
                  style: theme.textTheme.headline6!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            )
          : Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(itme.icon),
                  maxRadius: 14,
                  minRadius: 3,
                ),
                const SizedBox(width: 5),
                AutoSizeText(
                  itme.name,
                  minFontSize: 5,
                  maxFontSize: 10,
                  style: theme.textTheme.headline6!
                      .copyWith(fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ],
            ),
    );
  }
}
