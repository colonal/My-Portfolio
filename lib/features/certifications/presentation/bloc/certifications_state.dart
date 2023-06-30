part of 'certifications_bloc.dart';

abstract class CertificationsState {}

class CertificationsInitial extends CertificationsState {}

class CertificationsLoadingState extends CertificationsState {}

class CertificationsGetDataState extends CertificationsState {
  final List<Certifications> data;
  CertificationsGetDataState({
    required this.data,
  });
}

class CertificationsErrorStete extends CertificationsState {
  final String message;
  CertificationsErrorStete({
    required this.message,
  });
}
