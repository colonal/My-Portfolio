import 'package:my_profile/features/home/domain/entities/home.dart';

class HomeModel extends Home {
  HomeModel(
      {required name, required career, required image, required background})
      : super(name: name, career: career, image: image, background: background);

  factory HomeModel.fromJson(json) {
    return HomeModel(
        name: json["name"],
        career: json["career"],
        image: json["image"],
        background: json["background"]);
  }

  Map toJson() {
    return {
      "name": name,
      "career": career,
      "image": image,
      "background": background,
    };
  }
}
