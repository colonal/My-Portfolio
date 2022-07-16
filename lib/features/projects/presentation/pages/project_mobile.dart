import 'package:flutter/material.dart';
import 'package:my_profile/features/projects/presentation/widgets/content_widget.dart';
import '../../domain/entities/project.dart';
import '../widgets/itme_project.dart';

class ProjectMobile extends StatelessWidget {
  final List<Project> data;
  const ProjectMobile({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ContentPage(
      data: data,
      child: GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: 250,
          crossAxisSpacing: size.height * 0.1,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) =>
            ItmeProject(data: data[index], isDesktop: false),
      ),
    );
  }
}
