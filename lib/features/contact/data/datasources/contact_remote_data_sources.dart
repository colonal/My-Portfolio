import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_profile/features/contact/data/model/contact_model.dart';
import 'package:my_profile/features/contact/domain/entities/contact.dart';

abstract class ContactRemoteDataSource {
  Future<Unit> addContact(Contact data);
}

class ContactRemoteDataSourceImpl extends ContactRemoteDataSource {
  final FirebaseFirestore firestore;
  ContactRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<Unit> addContact(Contact data) async {
    await firestore.collection("contact").doc(data.email).set(
        {
          "contact": FieldValue.arrayUnion([ContactModel.toMap(data)]),
        },
        SetOptions(
          merge: true,
        ));
    return Future.value(unit);
  }
}
