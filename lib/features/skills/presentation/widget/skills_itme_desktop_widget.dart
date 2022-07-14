import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SkillsItmeDesktopWidget extends StatelessWidget {
  final Map<String, List> data;
  const SkillsItmeDesktopWidget({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.15,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.topStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              data.keys.first,
              minFontSize: 10,
              maxFontSize: 20,
              style: theme.textTheme.headline4,
            ),
            const SizedBox(height: 20),
            ...List.generate(
              data.values.first.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AutoSizeText(
                  "- ${data.values.first[index]}",
                  minFontSize: 10,
                  maxFontSize: 20,
                  style: theme.textTheme.headline6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
