import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/fade_animation.dart';
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
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) => FadeAnimation(
            offset: Offset(-1.0 * index, 0),
            duration: const Duration(seconds: 2),
            child: ItmeProject(data: data[index], isDesktop: false)),
      ),
    );
  }
}
