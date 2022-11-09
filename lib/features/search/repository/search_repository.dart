import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project_template/common/constants.dart';

final searchRepositoryProvider = Provider(
  (ref) => SearchRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class SearchRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  SearchRepository({
    required this.firestore,
    required this.auth,
  });

  //自分以外のuserを抽出
  Future<QuerySnapshot<Map<String, dynamic>>?> fetchUsers() async {
    return await firestore.collection(USERS).where("uid", whereNotIn: [
      auth.currentUser!.uid,
    ]).get();
  }
}
