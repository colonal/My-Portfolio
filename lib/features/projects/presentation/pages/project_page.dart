import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/utils/loding_widget.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/projects/presentation/bloc/project_bloc.dart';
import 'package:my_profile/features/projects/presentation/pages/project_desktop.dart';
import 'package:my_profile/features/projects/presentation/pages/project_mobile.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Theme.of(context).primaryColor,
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is ProjectGetDataState) {
            return ScreenHelper(
              desktop: PageDesktop(data: state.data),
              mobile: ProjectMobile(data: state.data),
            );
          }
          if (state is ProjectErrorState) {
            print("ProjectErrorState error: ${state.message}");
          }
          return const LodingWidget();
        },
      ),
    );
  }
}
