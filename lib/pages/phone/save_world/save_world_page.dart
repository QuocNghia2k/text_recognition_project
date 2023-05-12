import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../blocs/blocs.dart';

import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';

class SaveWorldPage extends StatefulWidget {
  final SaveWorldBloc bloc;
  const SaveWorldPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SaveWorldPage> createState() => _SaveWorldPageState();
}

class _SaveWorldPageState extends BaseState<SaveWorldPage, SaveWorldBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        title: Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Assets.images.png.logo.image(height: 19, width: 104)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            String path = "test.txt";
            createFile(path);
            writeToFile(path, "hihihihihi");
            openTextFile(path);
          },
          child: Text(
            "test",
            style: TextStyle(color: AppColors.primaryBlack),
          ),
        ),
      ),
    );
  }

  void writeToFile(String filePath, String content) {
    final file = File(filePath);

    file.writeAsString(content).then((_) {
      print('Content written to file successfully.');
    }).catchError((error) {
      print('Error writing to file: $error');
    });
  }

  void createFile(String filePath) {
    final file = File(filePath);

    file.create().then((_) {
      print('File created successfully.');
    }).catchError((error) {
      print('Error creating file: $error');
    });
  }

  void openTextFile(String filePath) async {
    OpenFile.open(filePath);
  }

  @override
  SaveWorldBloc get bloc => widget.bloc;
}
