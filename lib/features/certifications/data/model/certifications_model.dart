import '../../domain/entities/certifications.dart';

class CertificationsModel extends Certifications {
  CertificationsModel(
      {required super.title,
      required super.company,
      required super.issueDate,
      required super.url,
      required super.companyImage});

  factory CertificationsModel.fromJson(dynamic json) {
    return CertificationsModel(
      title: json["title"],
      company: json["company"],
      issueDate: json["issue_date"],
      url: json["url"],
      companyImage: json["company_image"],
    );
  }
}
