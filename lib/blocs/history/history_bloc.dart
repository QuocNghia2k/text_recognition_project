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

  Future<void> loadData() async {}

  Future<void> getData() async {
    var currentUserLogin = await FirebaseAuth.instance.currentUser;
    List<HistoryModel> currentData = [];
    await collection.where("email", isEqualTo: "${currentUserLogin?.email}").get().then((querySnapshot) {
      for (int i = 0; i < querySnapshot.size; i++) {
        var a = querySnapshot.docChanges[i];
        print("id: ${a.doc.id}::: data: ${a.doc.data()}");
        // var timeData = a.doc.data()?["time_create"] as Timestamp;
        // var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
        // var inputDate = inputFormat.parse(timeData.toDate().toString());
        // print("convert date tine::: ${inputDate.toString()}");
        currentData.add(HistoryModel.fromJson(a.doc.data() ?? {}, id: a.doc.id));
      }
      emit(HistoryState(state: state, data: List.from(currentData)));
    });
    print(currentData);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
