import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_profile/features/copyright/data/model/copyright_model.dart';

abstract class CopyrightDatasources {
  Future<CopyRightModel> getData();
}

class CopyrightDatasourcesImpl extends CopyrightDatasources {
  final FirebaseFirestore firebase;
  CopyrightDatasourcesImpl({
    required this.firebase,
  });
  @override
  Future<CopyRightModel> getData() async {
    final data =
        await firebase.collection("copyright").doc("DocCopyright").get();

    return CopyRightModel.fromJson(data.data());
  }
}
