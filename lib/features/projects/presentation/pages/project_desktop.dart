import 'package:flutter/material.dart';
import '../../../../core/widget/animation/fade_animation.dart';
import '../../domain/entities/project.dart';
import '../../../../core/widget/helper/count_widget.dart';
import '../widgets/content_widget.dart';
import '../widgets/itme_project.dart';

class PageDesktop extends StatefulWidget {
  final List<Project> data;
  const PageDesktop({required this.data, Key? key}) : super(key: key);

  @override
  State<PageDesktop> createState() => _PageDesktopState();
}

class _PageDesktopState extends State<PageDesktop> {
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
                    itemCount: (widget.data.length / 4).ceil(),
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
                          Expanded(
                            child: Row(
                              children: [
                                newMethod(index * 4),
                                newMethod(index * 4 + 1),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                newMethod(index * 4 + 2),
                                newMethod(index * 4 + 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CountWidget(
                    length: (widget.data.length / 4).ceil(),
                    select: select,
                    onTap: (index) {
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    })
              ],
            ));
  }

  Widget newMethod(int count) {
    return count < widget.data.length
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: FadeAnimation(
              offset: const Offset(0, 1),
              duration: Duration(milliseconds: (count + 6) * 100),
              child: ItmeProject(data: widget.data[count]),
            ),
          )
        : Container();
  }
}
