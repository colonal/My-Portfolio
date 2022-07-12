class SocialMedia {
  final Facebook facebook;
  final Linkedin linkedin;
  final Github github;
  SocialMedia(
      {required this.facebook, required this.github, required this.linkedin});
}

class Facebook {
  final String url;
  final String name;

  Facebook({required this.url, required this.name});
}

class Linkedin {
  final String url;
  final String name;

  Linkedin({required this.url, required this.name});
}

class Github {
  final String url;
  final String name;

  Github({required this.url, required this.name});
}
