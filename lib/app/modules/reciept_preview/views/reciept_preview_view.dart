import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/reciept_preview_controller.dart';

class RecieptPreviewView extends GetView<RecieptPreviewController> {
  ScreenshotController screenshotController = ScreenshotController();
  var scr = GlobalKey();
  Rx<File>? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: Text('Bill Preview'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              buildReciept(),
              ElevatedButton(
                onPressed: () async {
                  final image = await screenshotController
                      .captureFromWidget(buildReciept());
                  saveAndShare(image);
                },
                child: Text('Share'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    final strText = 'Shared From Restaurant App';

    await Share.shareFiles([image.path], text: strText);
  }

  Container buildReciept() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: Get.height * 0.3,
            width: Get.width,
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            child: Table(
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1),
              children: [
                TableRow(children: [
                  Column(children: [
                    Row(
                      children: [
                        Container(
                          height: Get.height * 0.1,
                          width: Get.height * 0.1,
                          margin: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black, width: 1.0.w)),
                          child: Center(
                            child: Text('LOGO'),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Restaurant Name',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              'Contact NO',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
                ]),
                TableRow(children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * 0.4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Bill No.'),
                                SizedBox(width: 15.w),
                                Text('515'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Date: '),
                                Text(
                                    '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * 0.4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Table No.'),
                                SizedBox(width: 15.w),
                                Text('5'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Print Time: '),
                                Text(
                                    '${DateTime.now().hour}:${DateTime.now().minute}')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Name of Customer : '),
                              SizedBox(width: 15.w),
                              Text('Abdul Khalid'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Mobile No : '),
                              SizedBox(width: 15.w),
                              Text('+9234567890'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
            child: Table(
              // defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1),
              children: [
                TableRow(
                    decoration: BoxDecoration(color: Colors.black),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(children: [
                          Text('S.No',
                              style: TextStyle(
                                  fontSize: 15.0.sp, color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text('Item',
                              style: TextStyle(
                                  fontSize: 15.0.sp, color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text('Qty',
                              style: TextStyle(
                                  fontSize: 15.0.sp, color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text('Price',
                              style: TextStyle(
                                  fontSize: 15.0.sp, color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: [
                          Container(
                              child: Text('Total',
                                  style: TextStyle(
                                      fontSize: 15.0.sp, color: Colors.white)))
                        ]),
                      ),
                    ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(children: [Text('1')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('Chicken')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('2')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('120')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('240')]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(children: [Text('2')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('Buger')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('4')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('130')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('520')]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(children: [Text('3')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('Shwarma')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('6')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('140')]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [Text('840')]),
                  ),
                ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.grey[350]),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(children: [Text('Total')]),
                      ),
                      SizedBox(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: [Text('18')]),
                      ),
                      SizedBox(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: [Text('1600')]),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
