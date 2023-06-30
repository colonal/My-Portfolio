import 'package:flutter/material.dart';

class TopBarItme extends StatefulWidget {
  final String text;

  final bool isClick;

  final bool isEnd;

  final void Function()? onTap;
  const TopBarItme(
      {required this.text,
      required this.onTap,
      this.isEnd = false,
      this.isClick = false,
      Key? key})
      : super(key: key);

  @override
  State<TopBarItme> createState() => _TopBarItmeState();
}

class _TopBarItmeState extends State<TopBarItme> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        isHover = !isHover;
        setState(() {});
      },
      hoverColor: Theme.of(context).hintColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                      width: 1,
                      color: widget.isEnd
                          ? Theme.of(context).hintColor
                          : Colors.transparent)),
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isHover || widget.isClick || widget.isEnd
                          ? Theme.of(context).hintColor
                          : Theme.of(context).cardColor,
                    ),
              ),
            ),
            if (isHover || widget.isClick)
              Container(
                width: 20,
                height: 1,
                color: Theme.of(context).hintColor,
              )
          ],
        ),
      ),
    );
  }
}
