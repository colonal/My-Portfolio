class SocialMedia {
  final Facebook facebook;
  final Linkedin linkedin;
  final Github github;
  SocialMedia(
      {required this.facebook, required this.github, required this.linkedin});
}

abstract class SocialMediaItme {
  final String url;
  final String name;
  final String icon;
  SocialMediaItme({
    required this.url,
    required this.name,
    required this.icon,
  });
}

class Facebook extends SocialMediaItme {
  Facebook(
      {required super.url,
      required super.name,
      super.icon = "assets/images/facebook.png"});
}

class Linkedin extends SocialMediaItme {
  Linkedin(
      {required super.url,
      required super.name,
      super.icon = "assets/images/linkedin.png"});
}

class Github extends SocialMediaItme {
  Github(
      {required super.url,
      required super.name,
      super.icon = "assets/images/github.png"});
}
