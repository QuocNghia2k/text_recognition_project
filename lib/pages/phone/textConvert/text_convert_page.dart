import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/inkwell_wrapper.dart';

class TextConvertPage extends StatefulWidget {
  final TextConvertBloc bloc;
  const TextConvertPage(this.bloc, {super.key});

  @override
  State<TextConvertPage> createState() => _TextConvertPageState();
}

class _TextConvertPageState extends BaseState<TextConvertPage, TextConvertBloc> {
  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";
  final DrawingController _drawingController = DrawingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        title: Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Assets.images.png.logo.image(height: 19, width: 104)),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: DrawingBoard(
                    controller: _drawingController,
                    background: Container(
                      width: 400,
                      height: MediaQuery.of(context).size.width,
                      color: Colors.white,
                    ),
                    showDefaultActions: true,
                    // showDefaultTools: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    scannedText,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                InkWellWrapper(
                  color: AppColors.primaryBlack,
                  child: Text(
                    "Scan Text",
                    style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    _getImageData();
                  },
                  paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
                ),
                SizedBox(height: 20),
                InkWellWrapper(
                  color: AppColors.primaryBlack,
                  child: Text(
                    localization.save_file_world,
                    style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    if (scannedText.isNotEmpty) {
                      Navigator.pushNamed(context, Routes.saveWorld, arguments: scannedText);
                    }
                  },
                  paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
                ),
              ],
            )),
      )),
    );
  }

  Future<void> _getImageData() async {
    //save file
    final dir = await getTemporaryDirectory();
    Uint8List imageData = (await _drawingController.getImageData())?.buffer.asUint8List() ?? Uint8List(1);
    var filename = '${dir.path}/image.png';
    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(imageData);
    //-------------------
    // Conver file
    final inputImage = InputImage.fromFile(file);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  TextConvertBloc get bloc => widget.bloc;
}
