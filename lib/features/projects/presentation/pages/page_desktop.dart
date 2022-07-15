import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/title_page.dart';
import 'package:my_profile/features/projects/domain/entities/project.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/snackbar_message.dart';

class PageDesktop extends StatelessWidget {
  final List<Project> data;
  const PageDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(
        "size.width > 800 ? 2 : 1: ${size.width > 800 ? 2 : 1}\t${size.width}");
    return CountPage(
      countText: "03",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height * 0.2,
              child: const FittedBox(
                fit: BoxFit.fill,
                child: TitlePage(
                  title: "Certifications",
                  subTitle: "My Certifications",
                  isCenter: true,
                ),
              ),
            ),
            // const SizedBox(height: 50),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: size.width,
              height: size.height * 0.7,
              child: GridView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 1000 ? 2 : 1,
                  mainAxisExtent: 250,
                  crossAxisSpacing: size.height * 0.1,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) =>
                    _buildItme(data: data[0], context: context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItme({required Project data, required BuildContext context}) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 700,
      // height: size.height * 0.6 * 0.5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.hintColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              data.image,
              // width: 150,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 600,
              // width: 300,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            data.name,
                            style: theme.textTheme.headline4,
                            maxLines: 2,
                            minFontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Image.network(
                          data.icon,
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  if (1 == 1)
                    Expanded(
                      child: Text(
                        data.description + data.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: theme.textTheme.headline6,
                      ),
                    ),
                  if (1 == 1)
                    Row(
                      children: [
                        Text(
                          "More Info:",
                          style: theme.textTheme.headline6,
                        ),
                        const SizedBox(width: 40),
                        ...List.generate(
                          data.infos.length,
                          (index) => InkWell(
                            onTap: () async {
                              try {
                                final Uri url =
                                    Uri.parse(data.infos[index].url);
                                if (!await launchUrl(url)) {
                                  throw 'Could not launch $url';
                                }
                              } catch (e) {
                                SnakBarMessage.showErrorSnackBar(
                                    message: e.toString(), context: context);
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 18,
                                child: Image.network(
                                  data.infos[index].icon,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
