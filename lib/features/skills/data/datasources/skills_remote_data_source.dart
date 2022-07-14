import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_profile/features/skills/data/model/skills_model.dart';
import 'package:my_profile/features/skills/domin/entites/skills.dart';

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
