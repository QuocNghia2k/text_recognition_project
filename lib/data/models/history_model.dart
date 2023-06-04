import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  String? id;
  String? content;
  String? email;
  Timestamp? timeCreate;
  String? nameFile;

  HistoryModel({this.id, this.content, this.email, this.timeCreate, this.nameFile});

  HistoryModel.fromJson(Map<String, dynamic> json, {String? idData}) {
    id = idData.toString();
    content = json['content'];
    email = json['email'];
    timeCreate = json['time_create'] as Timestamp;
    nameFile = json['name_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['content'] = this.content;
    data['email'] = this.email;
    data['time_create'] = this.timeCreate;
    data['name_file'] = this.nameFile;
    return data;
  }
}
