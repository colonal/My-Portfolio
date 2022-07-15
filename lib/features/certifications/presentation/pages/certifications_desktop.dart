import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/title_page.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:my_profile/features/certifications/presentation/widgets/grid_view_itme_widget.dart';

class CertificationsDesktop extends StatelessWidget {
  final List<Certifications> data;
  const CertificationsDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CountPage(
      countText: "03",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            const TitlePage(
              title: "Certifications",
              subTitle: "My Certifications",
              isCenter: true,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: size.height * 0.7,
              child: GridView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: size.width * 0.45,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: size.height * 0.18,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) =>
                    GridViewItmeWidget(data: data[index], isDesktop: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
