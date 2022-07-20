import 'package:my_profile/features/copyright/domain/entities/social_madia.dart';

class Copyright {
  final String messages;
  final String name;
  final List<SocialMedia> socialMedia;
  Copyright({
    required this.messages,
    required this.name,
    required this.socialMedia,
  });
}
