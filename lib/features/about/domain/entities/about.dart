import 'package:my_profile/features/about/domain/entities/social_media.dart';

class About {
  final String summary;
  final String name;
  final String phone;
  final int age;
  final String image;
  final SocialMedia socialMedia;
  About({
    required this.summary,
    required this.name,
    required this.phone,
    required this.age,
    required this.image,
    required this.socialMedia,
  });
}
