import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference mainDB =
      FirebaseFirestore.instance.collection('mainDB');

  Future updateUserData(String ptUid, String nutUid, String planUid) async {
    return await mainDB.doc(uid).set({
      'ptId': ptUid,
      'nutId': nutUid,
      'planId': planUid,
    });
  }
}
