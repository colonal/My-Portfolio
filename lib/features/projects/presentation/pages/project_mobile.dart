import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/fade_animation.dart';
import 'package:my_profile/features/projects/presentation/widgets/content_widget.dart';
import '../../../../core/widget/count_widget.dart';
import '../../domain/entities/project.dart';
import '../widgets/itme_project.dart';

class ProjectMobile extends StatefulWidget {
  final List<Project> data;
  const ProjectMobile({required this.data, Key? key}) : super(key: key);

  @override
  State<ProjectMobile> createState() => _ProjectMobileState();
}

class _ProjectMobileState extends State<ProjectMobile> {
  late PageController controller;
  int select = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentPage(
      child: (context, size) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: (widget.data.length / 2).ceil(),
              onPageChanged: (int index) {
                setState(() {
                  select = index;
                });
              },
              itemBuilder: (context, index) => SizedBox(
                width: size.width,
                height: size.height * 0.8,
                child: Column(
                  children: [
                    Expanded(child: newMethod(index * 2)),
                    Expanded(child: newMethod(index * 2 + 1)),
                  ],
                ),
              ),
            ),
          ),
          CountWidget(
              length: (widget.data.length / 2).ceil(),
              select: select,
              isMobile: true,
              onTap: (index) {
                controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              })
        ],
      ),
    );
  }

  Widget newMethod(int count) {
    return count < widget.data.length
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: FadeAnimation(
              offset: const Offset(0, 1),
              duration: Duration(milliseconds: (count + 6) * 100),
              child: ItmeProject(data: widget.data[count], isDesktop: false),
            ),
          )
        : Container();
  }
}
