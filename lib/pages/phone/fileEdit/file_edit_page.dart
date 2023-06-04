import 'package:flutter/material.dart';
import 'package:text_recognition_project/core/base/base.dart';
import 'package:text_recognition_project/data/data.dart';
import 'package:text_recognition_project/resources/resources.dart';

import '../../../blocs/blocs.dart';

class FileEditPage extends StatefulWidget {
  final HistoryBloc bloc;
  const FileEditPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<FileEditPage> createState() => _FileEditPageState();
}

class _FileEditPageState extends BaseState<FileEditPage, HistoryBloc> {
  TextEditingController controller = TextEditingController();
  bool showSave = false;
  late HistoryModel currentFile;
  late String content;

  @override
  void initData() {
    super.initData();
    try {
      currentFile = ModalRoute.of(context)!.settings.arguments as HistoryModel;
      controller.text = currentFile.content ?? "";
      content = currentFile.content ?? "";
    } catch (e) {
      print('get content to erro');
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _checkBackPage();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.darkCharcoal,
            size: 24.0,
          ),
        ),
        title: Text(
          "${currentFile.nameFile}.txt",
          style: theme.textTheme.titleSmall?.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w400),
        ),
        actions: [
          Visibility(
              visible: showSave,
              child: IconButton(
                onPressed: () {
                  bloc.updateData(currentFile.id ?? "", controller.text);
                  setState(() {
                    content = controller.text;
                    showSave = false;
                  });
                },
                icon: Icon(
                  Icons.save,
                  color: AppColors.darkCharcoal,
                  size: 24.0,
                ),
              ))
        ],
        backgroundColor: AppColors.primaryWhite,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                cursorColor: AppColors.primaryBlue,
                style: theme.textTheme.titleSmall?.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w400),
                maxLines: 9999,
                autofocus: true,
                onChanged: (value) {
                  if (value != content) {
                    if (showSave == false) {
                      setState(() {
                        showSave = true;
                      });
                    }
                  } else {
                    if (showSave == true) {
                      setState(() {
                        showSave = false;
                      });
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  void _checkBackPage() {
    if (showSave == false) {
      Navigator.pop(context);
    } else {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Do you want to save this document?",
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
                  bloc.updateData(currentFile.id ?? "", controller.text);
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
      ).whenComplete(() => Navigator.of(context).pop());
    }
  }

  @override
  HistoryBloc get bloc => widget.bloc;
}
