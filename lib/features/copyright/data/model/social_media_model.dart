import '../../domain/entities/social_madia.dart';

class SocialMediaModel extends SocialMedia {
  SocialMediaModel({required super.url, required super.icon});

  factory SocialMediaModel.fromJson(dynamic json) {
    return SocialMediaModel(url: json["url"], icon: json["icon"]);
  }
}
