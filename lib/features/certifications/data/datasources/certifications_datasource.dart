import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/certifications.dart';
import '../model/certifications_model.dart';

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
