import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/contact.dart';
import 'send_email.dart';

abstract class ContactRemoteDataSource {
  Future<Unit> addContact(Contact data);
}

class ContactRemoteDataSourceImpl extends ContactRemoteDataSource {
  final FirebaseFirestore firestore;
  final SendEmail sendEmail;
  static String yourName = "";
  ContactRemoteDataSourceImpl({
    required this.firestore,
    required this.sendEmail,
  }){
    _getName();
  }

  _getName() async{
    if(yourName.isEmpty){
      yourName = ((await firestore.collection("about").doc("DocAbout").get()).data()?["name"]) ??"";
    }
  }

  @override
  Future<Unit> addContact(Contact data) async {
    if(yourName.isEmpty){
      yourName = ((await firestore.collection("about").doc("DocAbout").get()).data()?["name"]) ??"";
    }
    await firestore.collection("contact").doc(data.email).set(
        {
          "contact": FieldValue.arrayUnion([data.toMap()]),
        },
        SetOptions(
          merge: true,
        ));
    await sendEmail.send(body: data.toEmailMap(yourName));
    return Future.value(unit);
  }
}
