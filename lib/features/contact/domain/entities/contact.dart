abstract class Contact {
  final String name;
  final String email;
  final String subject;
  final String message;
  Contact({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

   Map<String, String> toMap();
  Map<String, String> toEmailMap( String yourName);
}
