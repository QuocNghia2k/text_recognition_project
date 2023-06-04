import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../core/core.dart';
import '../blocs.dart';

class HistoryBloc extends BaseBloc<HistoryState> {
  HistoryBloc();
  final collection = FirebaseFirestore.instance.collection('historis');

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();
  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<void> loadData() async {}

  Future<void> getData() async {
    await collection.get().then((querySnapshot) {
      for (int i = 0; i < querySnapshot.size; i++) {
        var a = querySnapshot.docChanges[i];
        print("id: ${a.doc.id}::: data: ${a.doc.data()}");
        var timeData = a.doc.data()?["time_create"] as Timestamp;
        var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
        var inputDate = inputFormat.parse(timeData.toDate().toString());
        print("convert date tine::: ${inputDate.toString()}");
      }
    });
  }

  Future<void> setData(Map<String, dynamic> data) async {
    Map<String, dynamic> data = {"content": "hahaha", "email": "nghia@gmail.com", "time_create": Timestamp.now(), "name_file": "hehe"};
    await collection.add(data).then((value) => print("add conpelete")).catchError((e) => print("add failt"));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
