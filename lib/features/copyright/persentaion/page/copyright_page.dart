import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile/core/widget/loding_widget.dart';
import 'package:my_profile/features/copyright/persentaion/bloc/copyright_bloc.dart';

import 'content_contact.dart';

class CopyrightPage extends StatelessWidget {
  const CopyrightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopyrightBloc, CopyrightState>(
      builder: (context, state) {
        if (state is CopyrightGetDataState) {
          return ContentContact(data: state.data);
        }
        if (state is CopyrightErrorState) {
          return Container();
        }
        return const LodingWidget();
      },
    );
  }
}
