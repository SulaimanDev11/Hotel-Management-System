import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/reciept_controller.dart';

class RecieptView extends GetView<RecieptController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: Get.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bill No.'),
                          Text('515'),
                          SizedBox(width: 20.w)
                        ],
                      ),
                    ),
                    Text(
                      '950',
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Table No.'),
                          Text('515'),
                          SizedBox(width: 20.w)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      child: Text('Received Amount'),
                    ),
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Amount received',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.sp),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      child: Text('Customer name'),
                    ),
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Customer name',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      child: Text('Mobile No'),
                    ),
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
