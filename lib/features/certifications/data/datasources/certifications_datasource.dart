import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_profile/features/certifications/data/model/certifications_model.dart';

import 'package:my_profile/features/certifications/domain/entities/certifications.dart';

abstract class CertificationsDataSource {
  Future<List<Certifications>> certificationsgetData();
}

class CertificationsDataSourceImpl extends CertificationsDataSource {
  final FirebaseFirestore firebase;
  CertificationsDataSourceImpl({
    required this.firebase,
  });
  @override
  Future<List<Certifications>> certificationsgetData() async {
    List<Certifications> dataList = [];
    final DocumentSnapshot data = await firebase
        .collection("certification")
        .doc("DocCertifications")
        .get();
    for (var itme in (data.data() as Map)["certifications"] as List) {
      dataList.add(CertificationsModel.fromJson(itme));
    }
    return dataList;
  }
}
