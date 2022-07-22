import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/fade_animation.dart';
import 'package:my_profile/features/certifications/domain/entities/certifications.dart';
import 'package:my_profile/core/widget/count_widget.dart';
import 'package:my_profile/features/certifications/presentation/widgets/itme_widget.dart';

import '../widgets/content_widget.dart';

class CertificationsDesktop extends StatefulWidget {
  final List<Certifications> data;
  const CertificationsDesktop({required this.data, Key? key}) : super(key: key);

  @override
  State<CertificationsDesktop> createState() => _CertificationsDesktopState();
}

class _CertificationsDesktopState extends State<CertificationsDesktop> {
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
    return ContentWidget(
        child: (context, size) => SizedBox(
              height: size.height * 0.8,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (int index) {
                        setState(() {
                          select = index;
                        });
                      },
                      itemCount: (widget.data.length / 4).ceil(),
                      itemBuilder: (context, index) => FadeAnimation(
                          offset: const Offset(0, -1),
                          duration: const Duration(seconds: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    _buildItme(index),
                                    const SizedBox(width: 10),
                                    _buildItme(index * 4 + 1),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    _buildItme(index * 4 + 2),
                                    const SizedBox(width: 10),
                                    _buildItme(index * 4 + 3),
                                  ],
                                ),
                              ),
                            ],
                          )),
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
              ),
            ));
  }

  Widget _buildItme(int count) {
    return count < widget.data.length
        ? Expanded(child: ItmeWidget(data: widget.data[count], isDesktop: true))
        : Expanded(child: Container());
  }
}
