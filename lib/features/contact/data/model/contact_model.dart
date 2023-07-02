import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  ContactModel({
    required super.name,
    required super.email,
    required super.subject,
    required super.message,
  });

  @override
  Map<String, String> toMap() {
    return {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    };
  }
  
  @override
  Map<String, String> toEmailMap( String yourName) {
    return {
      "sendersName": name,
      "emailTo": email,
      "subject": subject,
      "userMessage": message,
      "yourName":yourName,
    };
  }
}
