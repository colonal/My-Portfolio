import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/snackbar_message.dart';

class ItmeWidget extends StatelessWidget {
  final Certifications data;
  final bool isDesktop;
  const ItmeWidget({required this.data, this.isDesktop = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              data.companyImage,
              fit: BoxFit.fill,
              errorBuilder: (_, __, ___) =>
                  Image.asset("assets/images/certification.png"),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        data.title,
                        style: theme.textTheme.headline4,
                        maxLines: 2,
                        minFontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: AutoSizeText(
                  data.company,
                  style: theme.textTheme.headline6!.copyWith(
                    // fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Flexible(
                child: AutoSizeText(
                  data.issueDate,
                  style: theme.textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
        ),
      ],
    );
  }
}
