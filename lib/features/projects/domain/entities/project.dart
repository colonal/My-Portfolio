import 'info.dart';

class Project {
  final String name;
  final String image;
  final String icon;
  final String description;
  final List<Info> infos;
  Project({
    required this.name,
    required this.image,
    required this.icon,
    required this.description,
    required this.infos,
  });
}
