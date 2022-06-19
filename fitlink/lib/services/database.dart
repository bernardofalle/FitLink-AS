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

  Future updateUserPT(String ptUid) async {
    return await mainDB.doc(uid).update({'ptId': ptUid});
  }

  Future updateUserNUT(String nutUid) async {
    return await mainDB.doc(uid).update({'nutId': nutUid});
  }

  Future updateUserPTplan(String planUid) async {
    return await mainDB.doc(uid).update({'planId': planUid});
  }

  Future updateUserNUTplan(String nutplanUid) async {
    return await mainDB.doc(uid).update({'nutplanUid': nutplanUid});
  }

  Future addUserPlan(String userUid) async {
    return await userPlans.add(uid);
  }
}
