import 'info_model.dart';
import '../../domain/entities/info.dart';
import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel(
      {required super.name,
      required super.image,
      required super.icon,
      required super.description,
      required super.infos});

  factory ProjectModel.fromJson(dynamic json) {
    return ProjectModel(
      name: json["name"],
      image: json["image"],
      icon: json["icons"],
      description: json["description"],
      infos: getInfo(json["info"] as List),
    );
  }

  static List<Info> getInfo(List json) {
    List<Info> data = [];

    for (var itme in json) {
      data.add(InfoMaodel.fromJson(itme));
    }

    return data;
  }
}
