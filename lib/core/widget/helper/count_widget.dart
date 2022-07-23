import 'package:flutter/material.dart';

class CountWidget extends StatelessWidget {
  final int length;
  final int select;
  final bool isMobile;
  final void Function(int index) onTap;
  const CountWidget(
      {required this.length,
      required this.select,
      required this.onTap,
      this.isMobile = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            length,
            (index) => InkWell(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: isMobile ? 15 : 25,
                width: isMobile ? 15 : 25,
                decoration: BoxDecoration(
                  color: select == index ? theme.hintColor : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.hintColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
