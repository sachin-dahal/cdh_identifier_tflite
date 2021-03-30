import 'package:cdh_identifier_tflite/common_widgets/KButton.dart';
import 'package:cdh_identifier_tflite/homepage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomepageController _homepageController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0),
          Text(
            " CAT - HUMAN - DOG ",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: Colors.green[400],
              letterSpacing: 1.5,
            ),
          ),
          Text(
            "  Identifier C-N-N",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.green[400],
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(height: 10.0),
          Image(image: AssetImage("assets/images/main_img.png")),
          SizedBox(height: 20.0),
          KButton(
              onPressed: () async {
                await _homepageController.getCameraResults();
                Get.defaultDialog(
                  content: GetBuilder<HomepageController>(
                      builder: (_homepageController) {
                    return _homepageController.isLoading
                        ? CircularProgressIndicator()
                        : Column(
                            children: [
                              Container(
                                height: 200.0,
                                child: Image.file(_homepageController.file),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(_homepageController.res[0]['label'].toString().substring(1)),
                              ElevatedButton(
                                  onPressed: () => Get.back(),
                                  child: Text("Okay"))
                            ],
                          );
                  }),
                  title: "CNN Identifier",
                  barrierDismissible: false,
                );
              },
              text: "Take a Photo"),
          KButton(
              onPressed: () async {
                await _homepageController.getGalleryResults();
                Get.defaultDialog(
                  content: GetBuilder<HomepageController>(
                      builder: (_homepageController) {
                    return _homepageController.isLoading
                        ? CircularProgressIndicator()
                        : Column(
                            children: [
                              Container(
                                height: 200.0,
                                child: Image.file(_homepageController.file),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(_homepageController.res[0]['label'].toString().substring(1)),
                              ElevatedButton(
                                  onPressed: () => Get.back(),
                                  child: Text("Okay"))
                            ],
                          );
                  }),
                  title: "CNN Identifier",
                  barrierDismissible: false,
                );
              },
              text: "Pick a Photo"),
        ],
      ),
    );
  }
}
