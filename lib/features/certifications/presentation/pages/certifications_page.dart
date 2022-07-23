import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/page/loading_widget.dart';
import '../../../../core/widget/helper/screen_helper.dart';
import '../bloc/certifications_bloc.dart';
import 'certifications_desktop.dart';
import 'certifications_mobile.dart';

import '../../../../core/widget/page/no_internet.dart';

class CertificationsPage extends StatelessWidget {
  const CertificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Theme.of(context).primaryColorDark,
      child: BlocBuilder<CertificationsBloc, CertificationsState>(
        builder: (context, state) {
          if (state is CertificationsGetDataState) {
            return ScreenHelper(
              desktop: CertificationsDesktop(data: state.data),
              mobile:
                  1 == 2 ? Container() : CertificationsMobile(data: state.data),
            );
          }
          if (state is CertificationsErrorStete) {
            return NoInternet(
              onPressed: () {
                BlocProvider.of<CertificationsBloc>(context)
                    .add(CertificationsGetDataEvent());
              },
            );
          }
          return const LodingWidget();
        },
      ),
    );
  }
}
