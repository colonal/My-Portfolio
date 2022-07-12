import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/utils/loding_widget.dart';
import 'package:my_profile/features/about/presentatioon/bloc/about_bloc.dart';
import 'package:my_profile/features/about/presentatioon/page/about_desktop.dart';

import '../../../../core/utils/screen_helper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Theme.of(context).primaryColorDark,
      child: BlocConsumer<AboutBloc, AboutState>(
        listener: (_, __) {},
        builder: (context, state) {
          if (state is AboutGetDataState) {
            return ScreenHelper(
              desktop: AboutDesktop(data: state.data),
              mobile: Container(),
            );
          }
          return const LodingWidget();
        },
      ),
    );
  }
}
