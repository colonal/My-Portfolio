import 'package:flutter/material.dart';
import '../animation/fade_animation.dart';

import 'top_bar_itme.dart';

List<String> topBar = [
  "Home",
  "About",
  "Skills",
  "Certifications",
  "Project",
  "Contact Me"
];

class TopBar extends StatefulWidget {
  final bool isScrollUp;
  final void Function(int index) onTap;
  const TopBar({required this.isScrollUp, required this.onTap, super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectItme = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.black.withOpacity(0.6),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: widget.isScrollUp ? 60 : 10,
      child: widget.isScrollUp
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  topBar.length,
                  (index) => FittedBox(
                    fit: BoxFit.scaleDown,
                    child: OpacityAnimation(
                      duration: const Duration(milliseconds: 600),
                      child: TopBarItme(
                        text: topBar[index],
                        isClick: index == selectItme,
                        isEnd: index == topBar.length - 1,
                        onTap: () {
                          widget.onTap(index);
                          setState(() {
                            selectItme = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
