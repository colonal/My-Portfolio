import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/page/loading_widget.dart';
import '../../../../core/widget/helper/screen_helper.dart';
import '../bloc/skills_bloc.dart';
import 'skills_desktop.dart';

import '../../../../core/widget/page/no_internet.dart';
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
          if (state is ErrorSkillsState) {
            return NoInternet(
              onPressed: () {
                BlocProvider.of<SkillsBloc>(context).add(GetDataSkillsEvent());
              },
            );
          }
          return const LodingWidget();
        },
      ),
    );
  }
}
