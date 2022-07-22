import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/core/widget/top_bar/drawer_widget.dart';
import 'package:my_profile/core/widget/top_bar/top_bar.dart';
import 'package:my_profile/core/widget/top_bar/top_bar_itme.dart';
import 'package:my_profile/features/certifications/presentation/pages/certifications_page.dart';
import 'package:my_profile/features/contact/persentation/page/contact_page.dart';
import 'package:my_profile/features/copyright/persentaion/page/copyright_page.dart';

import 'package:my_profile/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_profile/features/home/presentation/pages/home_page.dart';
import 'package:my_profile/features/projects/presentation/bloc/project_bloc.dart';
import 'package:my_profile/features/projects/presentation/pages/project_page.dart';
import 'package:my_profile/features/skills/presentation/bloc/skills_bloc.dart';
import 'package:my_profile/features/skills/presentation/pages/skills_page.dart';

import 'core/utils/my_bloc_observer.dart';
import 'features/about/presentation/bloc/about_bloc.dart';
import 'features/about/presentation/page/about_page.dart';
import 'features/certifications/presentation/bloc/certifications_bloc.dart';
import 'features/contact/persentation/bloc/contact_bloc.dart';
import 'features/copyright/persentaion/bloc/copyright_bloc.dart';
import 'ingection_container.dart' as di;

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
    return MultiBlocProvider(
      providers: [
        BlocOverrides.runZoned(
          () {
            return BlocProvider(
                create: (_) => di.sl<HomeBloc>()..add(HomeGetDataEvent()));
          },
          blocObserver: MyBlocObserver(),
        ),
        BlocOverrides.runZoned(
          () {
            return BlocProvider(
                create: (_) => di.sl<AboutBloc>()..add(AboutGetDataEvent()));
          },
          blocObserver: MyBlocObserver(),
        ),
        BlocOverrides.runZoned(
          () {
            return BlocProvider(
                create: (_) => di.sl<SkillsBloc>()..add(GetDataSkillsEvent()));
          },
          blocObserver: MyBlocObserver(),
        ),
        BlocOverrides.runZoned(
          () {
            return BlocProvider(
                create: (_) => di.sl<CertificationsBloc>()
                  ..add(CertificationsGetDataEvent()));
          },
          blocObserver: MyBlocObserver(),
        ),
        BlocOverrides.runZoned(
          () {
            return BlocProvider(
                create: (_) =>
                    di.sl<ProjectBloc>()..add(ProjectGetDataEvent()));
          },
          blocObserver: MyBlocObserver(),
        ),
        BlocOverrides.runZoned(
          () {
            return BlocProvider(
              create: (_) => di.sl<ContactBloc>(),
            );
          },
          blocObserver: MyBlocObserver(),
        ),
        BlocProvider(
          create: (_) => di.sl<CopyrightBloc>()..add(CopyRightGetDataEvent()),
        ),
      ],
      child: Scaffold(
        key: key,
        body: Stack(
          children: [
            ListView(
              controller: controller,
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
            ),
            if (!isDesktop)
              Positioned(
                  top: 5,
                  left: 5,
                  child: IconButton(
                      onPressed: () => key.currentState!.openDrawer(),
                      icon: const Icon(Icons.dehaze_rounded,
                          color: Colors.white))),
            if (isDesktop)
              Positioned(
                top: 0,
                right: 0,
                child: TopBar(
                  isScrollUp: isScrollUp,
                  onTap: (index) {
                    controller.animateTo(
                      index * MediaQuery.of(context).size.height,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                    );

                    if (index != 0) {
                      Future.delayed(const Duration(milliseconds: 800), () {
                        setState(() {
                          isScrollUp = false;
                        });
                      });
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
                    index * MediaQuery.of(context).size.height,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.fastOutSlowIn,
                  );
                },
              )
            : null,
      ),
    );
  }
}
