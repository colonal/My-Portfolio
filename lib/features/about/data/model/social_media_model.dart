import 'package:my_profile/features/about/domain/entities/social_media.dart';

class SocialMediaModel extends SocialMedia {
  SocialMediaModel(
      {required super.facebook,
      required super.github,
      required super.linkedin});
  factory SocialMediaModel.fromJson(Map json) {
    return SocialMediaModel(
        facebook: FacebookModel.fromJson(json["facebook"]),
        github: GithubModel.fromJson(json["github"]),
        linkedin: LinkedinModel.fromJson(json["linkedin"]));
  }
}

class FacebookModel extends Facebook {
  FacebookModel({required super.url, required super.name});

  factory FacebookModel.fromJson(Map json) {
    return FacebookModel(url: json["url"], name: json["name"]);
  }
}

class LinkedinModel extends Linkedin {
  LinkedinModel({required super.url, required super.name});

  factory LinkedinModel.fromJson(Map json) {
    return LinkedinModel(url: json["url"], name: json["name"]);
  }
}

class GithubModel extends Github {
  GithubModel({required super.url, required super.name});

  factory GithubModel.fromJson(Map json) {
    return GithubModel(url: json["url"], name: json["name"]);
  }
}
