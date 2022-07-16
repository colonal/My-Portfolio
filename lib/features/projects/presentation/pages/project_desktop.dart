import 'package:flutter/material.dart';
import 'package:my_profile/features/projects/domain/entities/project.dart';
import '../widgets/content_widget.dart';
import '../widgets/itme_project.dart';

class PageDesktop extends StatelessWidget {
  final List<Project> data;
  const PageDesktop({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ContentPage(
      data: data,
      child: GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > 1000 ? 2 : 1,
          mainAxisExtent: 250,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) => ItmeProject(data: data[index]),
      ),
    );
  }
}
