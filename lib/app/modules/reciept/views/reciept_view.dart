import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/reciept_controller.dart';

class RecieptView extends GetView<RecieptController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdcedc8),
      appBar: AppBar(
          backgroundColor: Colors.green[200], title: Text('Order Details')),
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
                          Text(
                            'Bill No.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                          Text(
                            '515',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
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
                          Text(
                            'Table No.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                          Text(
                            '515',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
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
                      child: Text(
                        'Received Amount',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      height: Get.height * 0.06,
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
                      child: Text(
                        'Customer name',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      height: Get.height * 0.06,
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
                      child: Text(
                        'Mobile No',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.5 - 15.w,
                      height: Get.height * 0.06,
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
              SizedBox(height: Get.height * 0.04),
              ActionButton(
                color: 0xff0288d1,
                title: 'Cash Received and Go Back',
                onTap: () {},
              ),
              SizedBox(height: Get.height * 0.015),
              ActionButton(
                color: 0xff9e9e9e,
                title: 'Cash Received and Print',
                onTap: () {},
              ),
              SizedBox(height: Get.height * 0.015),
              ActionButton(
                color: 0xff4caf50,
                title: 'Cash Received and WhatsApp',
                onTap: () {},
              ),
              SizedBox(height: Get.height * 0.015),
              ActionButton(
                color: 0xffff8a65,
                title: 'Bill Preview',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({required this.color, required this.onTap, required this.title});
  final int color;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Material(
        child: Container(
          height: Get.height * 0.07,
          width: Get.width - 100,
          decoration: BoxDecoration(
              color: Color(color), borderRadius: BorderRadius.circular(10.r)),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
