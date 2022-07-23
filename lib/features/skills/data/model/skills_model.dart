import '../../domin/entites/skills.dart';

class SkillsModel extends Skills {
  SkillsModel({required super.skills});

  factory SkillsModel.fromJson(dynamic json) {
    return SkillsModel(skills: json["skill"]);
  }
}
