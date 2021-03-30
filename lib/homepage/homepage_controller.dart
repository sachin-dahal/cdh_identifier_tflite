import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomepageController extends GetxController {
  final _picker = ImagePicker();
  bool isLoading = false;
  File file;
  List<dynamic> res;

  setLoading([bool loading = true]) {
    isLoading = loading;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _loadModel();
  }

  Future<String> _loadModel() async {
    String res = await Tflite.loadModel(
      model: "assets/nn_model/model_unquant.tflite",
      labels: "assets/nn_model/labels.txt",
      useGpuDelegate: true,
    );
    return res;
  }

  Future<List<dynamic>> _identifyImage(File file) async {
    var recognition = Tflite.runModelOnImage(
      path: file.path,
      imageMean: 120.0, // default = 117.0
      imageStd: 120.0, // 1.0
      numResults: 3, // categories
      threshold: 0.5, // 0.1
      asynch: true, // true
    );
    return recognition;
  }

  Future<File> _resultsButton(ImageSource imageSource) async {
    try {
      PickedFile image = await _picker.getImage(source: imageSource);
      file = File(image.path);
      return file;
    } catch (e) {
      print("KUCH TOH GADBAD HAI");
    }
    return null;
  }

  getCameraResults() async {
    final file = await _resultsButton(ImageSource.camera);
    setLoading();
    final results = await _identifyImage(file);
    res = results;
    print(results);
    Future.delayed(Duration(seconds: 1), () => setLoading(false));
    update();
  }

  getGalleryResults() async {
    final file = await _resultsButton(ImageSource.gallery);
    setLoading();
    final results = await _identifyImage(file);
    res = results;
    print(results);
    Future.delayed(Duration(seconds: 1), () => setLoading(false));
    update();
  }

  @override
  void onClose() {
    super.onClose();
    Tflite.close();
  }
}
