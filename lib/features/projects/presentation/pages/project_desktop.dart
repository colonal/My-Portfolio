import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/count_page.dart';
import 'package:my_profile/core/widget/title_page.dart';
import 'package:my_profile/features/projects/domain/entities/project.dart';
import '../widgets/itme_project.dart';

class PageDesktop extends StatelessWidget {
  final List<Project> data;
  const PageDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CountPage(
      countText: "03",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height * 0.2,
              child: const FittedBox(
                fit: BoxFit.fill,
                child: TitlePage(
                  title: "Certifications",
                  subTitle: "My Certifications",
                  isCenter: true,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: size.width,
              height: size.height * 0.7,
              child: GridView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 1000 ? 2 : 1,
                  mainAxisExtent: 250,
                  crossAxisSpacing: size.height * 0.1,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => ItmeProject(data: data[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
