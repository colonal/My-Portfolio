import '../../domain/entities/social_media.dart';

class SocialMediaModel extends SocialMedia {
  SocialMediaModel(
      {required super.facebook,
      required super.github,
      required super.linkedin});
  factory SocialMediaModel.fromJson(dynamic json) {
    (json as Map).forEach((key, value) {});
    return SocialMediaModel(
        facebook: FacebookModel.fromJson(json["facebook"] ?? {}),
        github: GithubModel.fromJson(json["github"] ?? {}),
        linkedin: LinkedinModel.fromJson(json["linkedin"] ?? {}));
  }
}

class FacebookModel extends Facebook {
  FacebookModel({required super.url, required super.name});

  factory FacebookModel.fromJson(dynamic json) {
    return FacebookModel(url: json["url"] ?? "", name: json["name"] ?? "");
  }
}

class LinkedinModel extends Linkedin {
  LinkedinModel({required super.url, required super.name});

  factory LinkedinModel.fromJson(dynamic json) {
    return LinkedinModel(url: json["url"] ?? "", name: json["name"] ?? "");
  }
}

class GithubModel extends Github {
  GithubModel({required super.url, required super.name});

  factory GithubModel.fromJson(dynamic json) {
    return GithubModel(url: json["url"] ?? "", name: json["name"] ?? "");
  }
}
