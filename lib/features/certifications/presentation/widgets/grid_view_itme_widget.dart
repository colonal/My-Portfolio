import 'package:flutter/material.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/snackbar_message.dart';

class GridViewItmeWidget extends StatelessWidget {
  final Certifications data;
  final bool isDesktop;
  const GridViewItmeWidget(
      {required this.data, this.isDesktop = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return GridTile(
      child: Container(
        alignment: Alignment.center,
        width: isDesktop ? size.width * 0.45 : size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: isDesktop ? null : size.width * 0.1,
              child: Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  data.companyImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: isDesktop ? size.width * 0.35 : size.width * 0.8,
                  child: Text(
                    data.title,
                    style: theme.textTheme.headline4!.copyWith(
                      fontSize: isDesktop ? 18 : 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data.company,
                  style: theme.textTheme.headline6!.copyWith(
                    fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data.issueDate,
                  style: theme.textTheme.headline6!.copyWith(
                    fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: theme.cardColor),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        final Uri url = Uri.parse(data.url);
                        if (!await launchUrl(url)) {
                          throw 'Could not launch $url';
                        }
                      } catch (e) {
                        SnakBarMessage.showErrorSnackBar(
                            message: e.toString(), context: context);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text("Show Credential"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
