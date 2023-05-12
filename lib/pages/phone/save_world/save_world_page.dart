import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../blocs/blocs.dart';
import 'package:docx_template/docx_template.dart';

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
            String nameFile = "test";
            writeDocxFile(nameFile, "hello");
            openFile(nameFile);
          },
          child: Text("test"),
        ),
      ),
    );
  }

  Future<void> writeDocxFile(String nameFile, String content) async {
    final file = File("${nameFile}.docx");

    // Open the file in write mode
    final randomAccessFile = file.openSync(mode: FileMode.write);

    // Write the text to the file
    randomAccessFile.writeStringSync(content);

    // Close the file
    randomAccessFile.closeSync();
  }

  void openFile(String nameFile) async {
    if (await canLaunch("${nameFile}.docx")) {
      await launch("${nameFile}.docx");
    } else {
      throw 'Could not open file';
    }
  }

  @override
  SaveWorldBloc get bloc => widget.bloc;
}
