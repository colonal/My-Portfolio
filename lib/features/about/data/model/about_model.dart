import 'package:my_profile/features/about/data/model/social_media_model.dart';
import 'package:my_profile/features/about/domain/entities/about.dart';

class AboutModel extends About {
  AboutModel(
      {required super.summary,
      required super.name,
      required super.phone,
      required super.age,
      required super.image,
      required super.socialMedia});

  factory AboutModel.fromJson(dynamic json) {
    return AboutModel(
      summary: json["summart"],
      name: json["name"],
      phone: json["phone"],
      age: json["age"],
      image: json["image"],
      socialMedia: SocialMediaModel.fromJson(json["social_media"]),
    );
  }
}
