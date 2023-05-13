import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../../blocs/blocs.dart';

import '../../../core/core.dart';
import '../../../enums.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';
import '../../../widgets/common_widget.dart';

class SaveWorldPage extends StatefulWidget {
  final SaveWorldBloc bloc;
  const SaveWorldPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SaveWorldPage> createState() => _SaveWorldPageState();
}

class _SaveWorldPageState extends BaseState<SaveWorldPage, SaveWorldBloc> {
  TextEditingController _nameFileController = TextEditingController();
  late String pathFile;
  late String content;
  @override
  void initData() {
    super.initData();
    try {
      content = ModalRoute.of(context)!.settings.arguments as String;
    } catch (e) {
      print('get content to erro');
    }
  }

  @override
  void initState() {
    super.initState();
    getFilePath();
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path;
    pathFile = appDocumentsPath;
    return appDocumentsPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        title: Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Assets.images.png.logo.image(height: 19, width: 104)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CommonTextField(
              textEditingController: _nameFileController,
              hintText: "Name file",
              contentPadding: EdgeInsets.all(8),
              prefixIconPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
              textInputType: TextInputType.text,
              inputStyle: InputStyleFontField.normalText,
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameFileController.text.isEmpty) {
                  _dialogBuilder(context);
                  return;
                } else {
                  writeToFile(_nameFileController.text, content);
                  openTextFile(_nameFileController.text);
                }
              },
              child: Text(
                "Export file",
                style: TextStyle(color: AppColors.primaryBlack),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void writeToFile(String filePath, String content) {
    File file = File('$pathFile/$filePath.txt'); // 1
    file.create(exclusive: true);
    file.writeAsString(content);
  }

  void openTextFile(String filePath) async {
    OpenFile.open("$pathFile/$filePath.txt");
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Name file is empty",
            style: TextStyle(color: AppColors.primaryBlack),
          ),
          actions: <Widget>[
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

  @override
  SaveWorldBloc get bloc => widget.bloc;
}
