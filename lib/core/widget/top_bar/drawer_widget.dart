import 'package:flutter/material.dart';

List<String> topBar = [
  "Home",
  "About",
  "Skills",
  "Certifications",
  "Project",
  "Contact Me"
];

class DrawerWidget extends StatefulWidget {
  final void Function(int index) onTap;
  const DrawerWidget({required this.onTap, super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  static int selectItme = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Drawer(
      backgroundColor: Theme.of(context).primaryColorDark,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            children: [
              ...List.generate(
                topBar.length,
                (index) => InkWell(
                  onTap: () {
                    selectItme = index;
                    Navigator.of(context).pop();
                    widget.onTap(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          topBar[index],
                          style: theme.textTheme.headline6!.copyWith(
                            color: selectItme == index
                                ? theme.hintColor
                                : theme.cardColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          height: 1,
                          color: selectItme == index
                              ? theme.hintColor
                              : theme.cardColor,
                          indent: 1,
                          thickness: 1,
                          // endIndent: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
