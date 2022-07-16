import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SkillsItmeMobileWidget extends StatelessWidget {
  final Map<String, List> data;
  final bool showDivider;
  const SkillsItmeMobileWidget(
      {required this.data, this.showDivider = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          data.keys.first,
          minFontSize: 20,
          maxFontSize: 25,
          style: theme.textTheme.headline4,
        ),
        // const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
                (data.values.first.length ~/ 3) == 0
                    ? 1
                    : ((data.values.first.length / 3).ceil()),
                (index) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextItme(data, context, index * 3),
                          buildTextItme(data, context, index * 3 + 1),
                          buildTextItme(data, context, index * 3 + 2),
                        ],
                      ),
                    ))
          ],
        ),
        const SizedBox(height: 15),
        if (showDivider)
          Divider(
            color: Colors.white.withOpacity(0.3),
            height: 2,
            thickness: 1.0,
            indent: MediaQuery.of(context).size.width * 0.1,
            endIndent: MediaQuery.of(context).size.width * 0.1,
          ),
      ],
    );
  }

  Widget buildTextItme(
      Map<String, List<dynamic>> data, BuildContext context, int count) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return count < data.values.first.length
        ? SizedBox(
            width: size.width * 0.33,
            height: 25,
            child: AutoSizeText(
              "- ${data.values.first[count]}",
              minFontSize: 10,
              maxFontSize: 20,
              maxLines: 2,
              style: theme.textTheme.headline6,
            ),
          )
        : Container();
  }
}
