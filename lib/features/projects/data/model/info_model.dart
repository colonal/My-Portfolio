import '../../domain/entities/info.dart';

class InfoMaodel extends Info {
  InfoMaodel({required super.url, required super.icon});

  factory InfoMaodel.fromJson(dynamic json) {
    return InfoMaodel(
      url: json["url"],
      icon: json["icon"],
    );
  }
}
