import 'package:flutter/material.dart';
import 'package:front_end/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:front_end/widgets/upload_image_box.dart';
import 'package:front_end/widgets/top_container.dart';
import 'package:front_end/widgets/drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UploadImage extends StatefulWidget {
  UploadImage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  List<XFile>? _imageFileList;
  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kDarkYellow,
        // leading: Icon(Icons.menu, color: LightColors.kDarkBlue, size: 30.0),
        elevation: 0,
        // bottom: Icon(Icons.search, color: LightColors.kDarkBlue, size: 25.0),
        actions: [
          // Icon(Icons.search, color: LightColors.kDarkBlue, size: 25.0),
        ],
        iconTheme: IconThemeData(color: LightColors.kDarkBlue),
      ),
      drawer: MyDrawer(),
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(children: <Widget>[
                            UploadImageBox(
                              cardColor: LightColors.kBlue,
                              title: 'Upload Image',
                              mainicon: Icons.add_a_photo,
                            )
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
