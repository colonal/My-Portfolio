import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/features/certifications/presentation/pages/certifications_page.dart';
import 'package:my_profile/features/contact/persentation/page/contact_page.dart';

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
import 'ingection_container.dart' as di;

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ],
      child: Scaffold(
        body: ListView(
          children: const [
            HomePage(),
            AboutPage(),
            SkilsPage(),
            CertificationsPage(),
            ProjectPage(),
            ContactPage(),
          ],
        ),
      ),
    );
  }
}
