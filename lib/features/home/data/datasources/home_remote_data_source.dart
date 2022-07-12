import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_profile/features/home/data/model/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getDataHome();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firebase;
  HomeRemoteDataSourceImpl({
    required this.firebase,
  });
  @override
  Future<HomeModel> getDataHome() async {
    return HomeModel.fromJson(
        await firebase.collection("home").doc("KFi6CIvksrIlLJ5m9gs2").get()
          ..data());
  }
}
