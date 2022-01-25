import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reciept_preview_controller.dart';

class RecieptPreviewView extends GetView<RecieptPreviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecieptPreviewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RecieptPreviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
