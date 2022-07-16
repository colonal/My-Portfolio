import 'package:flutter/material.dart';
import 'package:my_profile/features/certifications/presentation/widgets/grid_view_itme_widget.dart';
import '../../domain/entities/certifications.dart';
import '../widgets/content_widget.dart';

class CertificationsMobile extends StatelessWidget {
  final List<Certifications> data;
  const CertificationsMobile({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ContentWidget(
      data: data,
      child: GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: 200,
          crossAxisSpacing: size.height * 0.1,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) =>
            GridViewItmeWidget(data: data[index], isDesktop: true),
      ),
    );
  }
}
