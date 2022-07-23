import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/widget/helper/screen_helper.dart';
import 'core/widget/top_bar/drawer_widget.dart';
import 'core/widget/top_bar/top_bar.dart';
import 'features/certifications/presentation/pages/certifications_page.dart';
import 'features/contact/persentation/page/contact_page.dart';
import 'features/copyright/persentaion/page/copyright_page.dart';

import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/projects/presentation/bloc/project_bloc.dart';
import 'features/projects/presentation/pages/project_page.dart';
import 'features/skills/presentation/bloc/skills_bloc.dart';
import 'features/skills/presentation/pages/skills_page.dart';
import 'features/about/presentation/bloc/about_bloc.dart';
import 'features/about/presentation/page/about_page.dart';
import 'features/certifications/presentation/bloc/certifications_bloc.dart';
import 'features/contact/persentation/bloc/contact_bloc.dart';
import 'features/copyright/persentaion/bloc/copyright_bloc.dart';
import 'ingection_container.dart' as di;
import 'package:universal_html/html.dart' as html;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController controller;
  final GlobalKey<ScaffoldState> key = GlobalKey();
  bool isScrollUp = true;
  @override
  void initState() {
    controller = ScrollController();

    super.initState();
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        isScrollUp = false;
      }
      if (controller.position.userScrollDirection == ScrollDirection.forward) {
        isScrollUp = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    final Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<HomeBloc>()..add(HomeGetDataEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<AboutBloc>()..add(AboutGetDataEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<SkillsBloc>()..add(GetDataSkillsEvent()),
        ),
        BlocProvider(
          create: (_) =>
              di.sl<CertificationsBloc>()..add(CertificationsGetDataEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<ProjectBloc>()..add(ProjectGetDataEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<ContactBloc>(),
        ),
        BlocProvider(
          create: (_) => di.sl<CopyrightBloc>()..add(CopyRightGetDataEvent()),
        ),
      ],
      child: Scaffold(
        key: key,
        body: Stack(
          children: [
            isDesktop
                ? _buildListView()
                : RefreshIndicator(
                    color: Theme.of(context).hintColor,
                    onRefresh: () async {
                      Navigator.of(context).pop();
                      html.window.location.reload();
                    },
                    child: _buildListView(),
                  ),
            if (!isDesktop)
              Positioned(
                top: 5,
                left: 5,
                child: IconButton(
                  onPressed: () => key.currentState!.openDrawer(),
                  icon: const Icon(Icons.dehaze_rounded, color: Colors.white),
                ),
              ),
            if (isDesktop)
              Positioned(
                top: 0,
                right: 0,
                child: TopBar(
                  isScrollUp: isScrollUp,
                  onTap: (index) {
                    controller.animateTo(
                      index * size.height,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                    );

                    if (index != 0) {
                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          setState(
                            () {
                              isScrollUp = false;
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              )
          ],
        ),
        drawer: !isDesktop
            ? DrawerWidget(
                onTap: (index) {
                  controller.animateTo(
                    index * size.height,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.fastOutSlowIn,
                  );
                },
              )
            : null,
      ),
    );
  }

  ListView _buildListView() {
    return ListView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: const [
        HomePage(),
        AboutPage(),
        SkilsPage(),
        CertificationsPage(),
        ProjectPage(),
        ContactPage(),
        CopyrightPage(),
      ],
    );
  }
}
