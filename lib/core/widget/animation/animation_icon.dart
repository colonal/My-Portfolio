import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimationIcon extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;
  const AnimationIcon({required this.child, this.onTap, super.key});

  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 1, end: 360)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (valu) {
        if (valu) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: animation,
        child: widget.child,
        builder: (context, child) {
          return Transform.scale(
            scale: ((animation.value * (1 / 360)) + 1) > 1.6
                ? 1.5
                : (animation.value * (1 / 360)) + 1,
            child: Transform.rotate(
              angle: animation.value * (math.pi / 180),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
