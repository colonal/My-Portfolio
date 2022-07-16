import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/project.dart';

class ItmeProject extends StatelessWidget {
  final Project data;
  final bool isDesktop;
  const ItmeProject({required this.data, this.isDesktop = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 700,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.hintColor,
          width: 2,
        ),
      ),
      child: isDesktop
          ? Row(
              children: [
                _buildImage(),
                const SizedBox(width: 20),
                _buildContent(theme, context),
              ],
            )
          : Column(
              children: [
                _buildImage(),
                _buildContent(theme, context),
              ],
            ),
    );
  }

  Widget _buildContent(ThemeData theme, BuildContext context) {
    return Expanded(
      flex: 4,
      child: SizedBox(
        height: 700,
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
            Expanded(
              child: AutoSizeText(
                data.description + data.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                minFontSize: 10,
                style: theme.textTheme.headline6,
              ),
            ),
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
                        final Uri url = Uri.parse(data.infos[index].url);
                        if (!await launchUrl(url)) {
                          throw 'Could not launch $url';
                        }
                      } catch (e) {
                        SnakBarMessage.showErrorSnackBar(
                            message: e.toString(), context: context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }

  Widget _buildImage() {
    return Expanded(
      flex: isDesktop ? 1 : 2,
      child: Image.network(
        data.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
