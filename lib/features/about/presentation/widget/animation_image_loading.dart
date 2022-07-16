import 'package:flutter/material.dart';
import 'dart:math' as m;

class AnimationImageLoading extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;

  const AnimationImageLoading(
      {required this.child,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  State<AnimationImageLoading> createState() => _AnimationImageLoadingState();
}

class _AnimationImageLoadingState extends State<AnimationImageLoading>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat();
    animation =
        Tween<Offset>(begin: const Offset(-1000, 0), end: const Offset(1050, 0))
            .animate(controller);
    super.initState();
  }

  @override
  void deactivate() {
    controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 10),
      ),
      child: Stack(
        children: [
          widget.child,
          Transform.scale(
            scale: 1.5,
            child: Transform.rotate(
              angle: 40 * (m.pi / 180),
              child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, value) {
                    return Container(
                      width: widget.width / 4,
                      height: widget.height,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: animation.value,
                            blurRadius: 150,
                            spreadRadius: 50,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
