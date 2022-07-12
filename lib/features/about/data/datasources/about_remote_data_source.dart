import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_profile/features/about/data/model/about_model.dart';

abstract class AboutRemoteDataSource {
  Future<AboutModel> getDataAbout();
}

class AboutRemoteDataSourceImpl extends AboutRemoteDataSource {
  final FirebaseFirestore firebase;
  AboutRemoteDataSourceImpl({
    required this.firebase,
  });
  @override
  Future<AboutModel> getDataAbout() async {
    return AboutModel.fromJson(
      await firebase.collection("about").doc("123").get()
        ..data(),
    );
  }
}
