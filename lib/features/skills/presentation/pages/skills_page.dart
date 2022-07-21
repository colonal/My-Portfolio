import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/widget/loding_widget.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/skills/presentation/bloc/skills_bloc.dart';
import 'package:my_profile/features/skills/presentation/pages/skills_desktop.dart';

import 'skills_mobile.dart';

class SkilsPage extends StatelessWidget {
  const SkilsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Theme.of(context).primaryColor,
      child: BlocBuilder<SkillsBloc, SkillsState>(
        builder: (context, state) {
          if (state is GetDataSkillsState) {
            return ScreenHelper(
              desktop: SkillsDesktop(data: state.data),
              mobile: SkillsMobile(data: state.data),
            );
          }
          return const LodingWidget();
        },
      ),
    );
  }
}
