import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domin/entites/skills.dart';
import '../model/skills_model.dart';

abstract class SkillsRemoteDataSource {
  Future<Skills> getDataSkills();
}

class SkillsRemoteDataSourceImpl extends SkillsRemoteDataSource {
  final FirebaseFirestore firebase;
  SkillsRemoteDataSourceImpl({
    required this.firebase,
  });
  @override
  Future<Skills> getDataSkills() async {
    final DocumentSnapshot doc =
        await firebase.collection("skills").doc("DocSkills").get();
    return SkillsModel.fromJson(doc.data());
  }
}
