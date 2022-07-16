import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/utils/loding_widget.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/certifications/presentation/bloc/certifications_bloc.dart';
import 'package:my_profile/features/certifications/presentation/pages/certifications_desktop.dart';
import 'package:my_profile/features/certifications/presentation/pages/certifications_mobile.dart';

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
              mobile: CertificationsMobile(data: state.data),
            );
          }
          if (state is CertificationsErrorStete) {}
          return const LodingWidget();
        },
      ),
    );
  }
}
