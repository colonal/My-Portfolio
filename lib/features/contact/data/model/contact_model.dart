import 'package:my_profile/features/contact/domain/entities/contact.dart';

class ContactModel extends Contact {
  ContactModel({
    required super.name,
    required super.email,
    required super.subject,
    required super.message,
  });

  static Map<String, String> toMap(Contact model) {
    return {
      "name": model.name,
      "email": model.email,
      "subject": model.subject,
      "message": model.message,
    };
  }
}
