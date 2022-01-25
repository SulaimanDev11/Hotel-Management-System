import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pos_rest/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1500), () {
      Get.offAndToNamed(Routes.DASHBOARD);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Get.height * 0.5,
            width: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage('assets/images/onBoard.png'),
                  height: Get.height * 0.3,
                  width: Get.height * 0.3,
                ),
                Text(
                  'Point Of Sale',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
            child: Text(
              'Hotel managers are responsible for managing employees and for planning, marketing , coordinating and administering hotel services such as catering and accommodation facilities.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
