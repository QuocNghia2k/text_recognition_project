import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_recognition_project/data/data.dart';
import 'widgets/history_component.dart';
import '../../../core/base/base.dart';
import '../../../blocs/blocs.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';

class HistoryPage extends StatefulWidget {
  final HistoryBloc bloc;
  const HistoryPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseState<HistoryPage, HistoryBloc> {
  late String path;
  @override
  void initState() {
    FirebaseFirestore.instance.collection('historis').snapshots().listen((event) {
      bloc.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<List<HistoryModel>?>(
                  stream: bloc.historyStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Text(
                          "You have no history convert text",
                          style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                        );
                      }
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var data = snapshot.data?[index];
                            return HistoryComponent(
                              historyModel: data,
                              onTap: () {
                                _openFile(data!);
                              },
                              onDelete: (value) {
                                _onDeleteHistory(value);
                              },
                              onUpdate: (value) {
                                Navigator.pushNamed(context, Routes.fileEdit, arguments: value);
                              },
                            );
                          });
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryBlack,
                      ));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onDeleteHistory(HistoryModel data) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Do you want to delete this document?",
            style: TextStyle(color: AppColors.primaryBlack),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: AppColors.primaryBlack),
              ),
              onPressed: () {
                bloc.deleteData(data);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.primaryBlack),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _openFile(HistoryModel historyModel) async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String path = appDocumentsDirectory.path;
    File file = File('$path/${historyModel.nameFile}.txt'); // 1
    file.create(exclusive: true, recursive: true);
    file.writeAsString(historyModel.content ?? "");
    OpenFile.open('$path/${historyModel.nameFile}.txt');
  }

  @override
  HistoryBloc get bloc => widget.bloc;
}
