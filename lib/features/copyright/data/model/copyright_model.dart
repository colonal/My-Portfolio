import 'package:my_profile/features/copyright/data/model/social_media_model.dart';
import 'package:my_profile/features/copyright/domain/entities/copyright.dart';

import '../../domain/entities/social_madia.dart';

class CopyRightModel extends Copyright {
  CopyRightModel(
      {required super.messages,
      required super.name,
      required super.socialMedia});

  factory CopyRightModel.fromJson(dynamic json) {
    return CopyRightModel(
      messages: json["messages"],
      name: json["name"],
      socialMedia: getSocialMedia(json["social_media"] as List),
    );
  }

  static List<SocialMedia> getSocialMedia(List socialMedia) {
    List<SocialMedia> data = [];
    for (var element in socialMedia) {
      data.add(SocialMediaModel.fromJson(element));
    }

    return data;
  }
}
