import 'package:flutter/material.dart';
import '../../domain/entities/home.dart';
import '../widget/content_widget.dart';

class HomeDesktop extends StatelessWidget {
  final Home data;
  const HomeDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size szie = MediaQuery.of(context).size;
    return ContentWidget(
      data: data,
      imgSize: szie.height < 560
          ? Size(szie.height * 0.3, szie.height * 0.3)
          : const Size(292, 292),
    );
  }
}
