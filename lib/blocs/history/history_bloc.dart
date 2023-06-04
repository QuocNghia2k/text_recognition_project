import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:text_recognition_project/data/data.dart';

import '../../core/core.dart';
import '../blocs.dart';

class HistoryBloc extends BaseBloc<HistoryState> {
  HistoryBloc();
  final collection = FirebaseFirestore.instance.collection('historis');

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();
  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<List<HistoryModel>?> get historyStream => stateStream.map((event) => event.data);

  Future<void> getData() async {
    var currentUserLogin = await FirebaseAuth.instance.currentUser;
    List<HistoryModel> currentData = [];
    await collection.where("email", isEqualTo: "${currentUserLogin?.email}").get().then((querySnapshot) {
      for (int i = 0; i < querySnapshot.size; i++) {
        var a = querySnapshot.docChanges[i];
        var currentId = a.doc.id.toString();
        currentData.add(HistoryModel.fromJson(a.doc.data() ?? {}, idData: currentId));
      }
      emit(HistoryState(state: state, data: List.from(currentData)));
    });
  }

  Future<void> updateData(String idUpdate, String content) async {
    await collection.doc(idUpdate).update({"content": content});
  }

  Future<void> deleteData(HistoryModel data) async {
    await collection.doc(data.id).delete();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
