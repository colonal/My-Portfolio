import 'package:flutter/material.dart';
import '../../domain/entities/home.dart';
import '../widget/content_widget.dart';

class HomeDesktop extends StatelessWidget {
  final Home data;
  const HomeDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ContentWidget(
          data: data,
          imgSize: constraints.maxHeight < 560
              ? Size(constraints.maxHeight * 0.3, constraints.maxHeight * 0.3)
              : const Size(292, 292),
        );
      }
    );
  }
}
