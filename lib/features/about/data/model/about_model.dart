import 'social_media_model.dart';
import '../../domain/entities/about.dart';

class AboutModel extends About {
  AboutModel(
      {required super.summary,
      required super.name,
      required super.phone,
      required super.age,
      required super.image,
      required super.address,
      required super.socialMedia});

  factory AboutModel.fromJson(dynamic json) {
    return AboutModel(
      summary: json["summary"],
      name: json["name"],
      phone: json["phone"],
      age: json["age"],
      image: json["image"],
      address: json["address"],
      socialMedia: SocialMediaModel.fromJson(json["social_media"]),
    );
  }
}
