import 'package:flutter/material.dart';
import '../../domain/entities/home.dart';

import '../widget/content_widget.dart';

class HomeMobile extends StatelessWidget {
  final Home data;
  const HomeMobile({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ContentWidget(
          data: data,
          imgSize: constraints.maxHeight < 452
              ? Size(constraints.maxHeight * 0.2, constraints.maxHeight * 0.2)
              : const Size(150, 150),
          widthLine: 40,
        );
      }
    );
  }
}