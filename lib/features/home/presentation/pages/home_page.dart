import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/page/no_internet.dart';
import '../../../../core/widget/helper/screen_helper.dart';
import '../bloc/home_bloc.dart';
import 'home_desktop.dart';
import '../../../../core/widget/page/loading_widget.dart';

import 'home_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (_, __) {},
        builder: (context, state) {
          debugPrint("state $state");
          if (state is HomeGgetDataState) {
            return ScreenHelper(
              desktop: HomeDesktop(data: state.data),
              mobile: HomeMobile(data: state.data),
            );
          }
          if (state is HomeFailureDataState) {
            return NoInternet(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(HomeGetDataEvent());
              },
            );
          }

          return const LodingWidget();
        },
      ),
    );
  }
}
