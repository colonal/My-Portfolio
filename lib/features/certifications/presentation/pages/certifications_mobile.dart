import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/widget/fade_animation.dart';
import 'package:my_profile/core/widget/count_widget.dart';
import 'package:my_profile/features/certifications/presentation/widgets/itme_widget.dart';
import '../../domain/entities/certifications.dart';
import '../widgets/content_widget.dart';

class CertificationsMobile extends StatefulWidget {
  final List<Certifications> data;
  const CertificationsMobile({required this.data, Key? key}) : super(key: key);

  @override
  State<CertificationsMobile> createState() => _CertificationsMobileState();
}

class _CertificationsMobileState extends State<CertificationsMobile> {
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
                      itemCount: (widget.data.length / 2).ceil(),
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _buildItme(index)),
                          Expanded(child: _buildItme(index * 2 + 1)),
                        ],
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
            ));
  }

  Widget _buildItme(int count) {
    return count < widget.data.length
        ? ItmeWidget(data: widget.data[count], isDesktop: false)
        : Expanded(child: Container());
  }
}
