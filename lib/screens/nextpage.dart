import 'dart:typed_data';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class nextpage extends StatefulWidget {
  nextpage({Key? key, required this.quote, required this.image}) : super(key: key);
  String quote;
  Widget image;
  @override
  State<nextpage> createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {

  late Uint8List _imageFile;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        title: const Text(
          "Save and Share",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Screenshot(
            controller: screenshotController,
            child: Container(
              height: 500,
              width: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  widget.image,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      widget.quote,
                      textAlign: TextAlign.center,
                      style:
                           TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white)),
                    ),

                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    await screenshotController
                        .capture()
                        .then((Uint8List? image) {
                      //Capture Done
                      setState(() {
                        _imageFile = image!;
                      });
                    }).catchError((onError) {
                      print(onError);
                    });

                    final result =
                    await ImageGallerySaver.saveImage(_imageFile);

                    print(result);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Image is sucessfully saved in gallery.."),
                      backgroundColor: Colors.greenAccent,
                    ));
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange.shade200,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.download_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () async {
                    await screenshotController
                        .capture()
                        .then((Uint8List? image) {
                      //Capture Done
                      setState(() {
                        _imageFile = image!;
                      });
                    }).catchError((onError) {
                      print(onError);
                    });

                    await Share.file(
                        'esys image', 'esys.png', _imageFile, 'image/png',
                        text: 'More on Anandi_Quote_App');
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent.shade100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.share,
                          color: Colors.black,
                          size: 30,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.greenAccent.shade100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      "Apply",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}