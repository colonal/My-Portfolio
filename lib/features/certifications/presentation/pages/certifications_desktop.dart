import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/fade_animation.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:my_profile/features/certifications/presentation/widgets/grid_view_itme_widget.dart';

import '../widgets/content_widget.dart';

class CertificationsDesktop extends StatelessWidget {
  final List<Certifications> data;
  const CertificationsDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ContentWidget(
      data: data,
      child: GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > 856 ? 2 : 1,
          mainAxisExtent: 200,
          crossAxisSpacing: 30,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) => FadeAnimation(
            offset: const Offset(0, -1),
            duration: const Duration(seconds: 2),
            child: GridViewItmeWidget(data: data[index], isDesktop: true)),
      ),
    );
  }
}
