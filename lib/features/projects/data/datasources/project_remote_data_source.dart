import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_profile/features/projects/data/model/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getDataProject();
}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  final FirebaseFirestore firebase;
  ProjectRemoteDataSourceImpl({
    required this.firebase,
  });

  @override
  Future<List<ProjectModel>> getDataProject() async {
    List<ProjectModel> dataList = [];
    final DocumentSnapshot data =
        await firebase.collection("projects").doc("DocProjects").get();

    for (var itme in (data.data() as Map)["projects"] as List) {
      dataList.add(ProjectModel.fromJson(itme));
    }
    return dataList;
  }
}
