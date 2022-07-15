import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/features/certifications/presentation/widgets/grid_view_itme_widget.dart';

import '../../../../core/widget/title_page.dart';
import '../../domain/entities/certifications.dart';

class CertificationsMobile extends StatelessWidget {
  final List<Certifications> data;
  const CertificationsMobile({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CountPage(
      countText: "03",
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                height:
                    size.height < 550 ? size.height * 0.5 : size.height * 0.7,
                child: GridView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.height < 550
                        ? 1
                        : size.height < 700
                            ? 2
                            : 3,
                    mainAxisExtent: size.width,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => GridViewItmeWidget(
                    data: data[index],
                    isDesktop: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
