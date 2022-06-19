import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference mainDB =
      FirebaseFirestore.instance.collection('mainDB');
  final CollectionReference userPlans =
      FirebaseFirestore.instance.collection('userPlans');

  Future updateUserData(
      String ptUid, String nutUid, String ptplanUid, String nutplanUid) async {
    return await mainDB.doc(uid).set({
      'ptId': ptUid,
      'nutId': nutUid,
      'planId': ptplanUid,
      'nutplanUid': nutplanUid,
    });
  }

  Future updateUserPT() async {
    return await mainDB.doc(uid).set({});
  }

  Future addUserPlan(String userUid) async {
    return await userPlans.add(uid);
  }
}
