import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/about_model.dart';

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
    final DocumentSnapshot doc =
        await firebase.collection("about").doc("DocAbout").get();
    final Map data = doc.data() as Map;

    data["social_media"] = {
      "facebook": await firebase
          .collection("about")
          .doc("DocAbout")
          .collection("socialMedia")
          .doc("DocSocialMedia")
          .collection("faceboke")
          .doc("DocFaceboke")
          .get()
        ..data,
      "github": await firebase
          .collection("about")
          .doc("DocAbout")
          .collection("socialMedia")
          .doc("DocSocialMedia")
          .collection("github")
          .doc("DocGithub")
          .get()
        ..data,
      "linkedin": await firebase
          .collection("about")
          .doc("DocAbout")
          .collection("socialMedia")
          .doc("DocSocialMedia")
          .collection("linkdin")
          .doc("DocLinkdin")
          .get()
        ..data,
    };

    return AboutModel.fromJson(
      data,
    );
  }
}
