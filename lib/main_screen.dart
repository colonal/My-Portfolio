import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_profile/features/home/presentation/pages/home_page.dart';

import 'core/utils/my_bloc_observer.dart';
import 'features/about/presentation/bloc/about_bloc.dart';
import 'features/about/presentation/page/about_page.dart';
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
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              HomePage(),
              AboutPage(),
            ],
          ),
        ),
      ),
    );
  }
}
