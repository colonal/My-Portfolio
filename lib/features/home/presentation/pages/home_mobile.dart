import 'package:flutter/material.dart';
import 'package:my_profile/features/home/domain/entities/home.dart';

import '../widget/content_widget.dart';

class HomeMobile extends StatelessWidget {
  final Home data;
  const HomeMobile({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size szie = MediaQuery.of(context).size;
    return ContentWidget(
      data: data,
      imgSize: szie.height < 452
          ? Size(szie.height * 0.2, szie.height * 0.2)
          : const Size(150, 150),
      widthLine: 40,
    );
  }
}

// 452