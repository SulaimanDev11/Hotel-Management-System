import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_rest/app/routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  var data = [
    {'tableId': 'tableId1', 'tableName': 'tableName1', 'productId': '12'},
    {'tableId': 'tableId2', 'tableName': 'tableName2', 'productId': '34'},
    {'tableId': 'tableId3', 'tableName': 'tableName3', 'productId': '56'},
    {'tableId': 'tableId4', 'tableName': 'tableName4', 'productId': '78'},
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text('POSRest'),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.RECIEPT);
            },
            icon: Icon(Icons.forward)),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              value == 1
                  ? showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text('Add New Portion')),
                          content: Container(
                            height: Get.height * 0.2,
                            width: Get.width - 50.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter portion name',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.queryPortion();
                                    Get.back();
                                  },
                                  child: Container(
                                    height: Get.height * 0.07,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.green.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 7,
                                              offset: Offset(0, 2)),
                                        ]),
                                    child: Center(
                                        child: Text(
                                      'ADD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: Colors.white),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text('Column Quantity Change')),
                          content: Container(
                            height: Get.height * 0.25,
                            width: Get.width - 50.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Slider(
                                    divisions: 5,
                                    min: 1.0,
                                    max: 5.0,
                                    value: 1,
                                    onChanged: (value) {
                                      value = value;
                                    },
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Back Color',
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffe0f7fa,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffFFFFFF,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xfffff9c4,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xff90caf9,
                                            categoty: '',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Back Table Color',
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffe8f5e9,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffbdbdbd,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffffe082,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xff9fa8da,
                                            categoty: '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Empty Table Color',
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffb2ebf2,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffeceff1,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xfffff59d,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffc5cae9,
                                            categoty: '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount Color',
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffe0e0e0,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xff000000,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xffef6c00,
                                            categoty: '',
                                          ),
                                          ColorCategory(
                                            controller: controller,
                                            color: 0xff3f51b5,
                                            categoty: '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Approve'),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        );
                      },
                    );
            },
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Add New Portion"), value: 1),
              PopupMenuItem(child: Text("Change Layout Setting"), value: 2)
            ],
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(controller.datalist.length, (index) {
            return GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('AlertDialog Title'),
                      content: Container(
                        height: Get.height * 0.2,
                        child: Column(
                          children: [
                            TextField(controller: nameController),
                            TextField(controller: priceController),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Approve'),
                          onPressed: () {
                            controller.insertPortion(nameController.text,
                                int.parse(priceController.text));
                            Get.back();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                // height: Get.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // height: Get.height * 0.1,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Get.height * 0.08,
                                width: Get.width * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.datalist[index]['dataName']}',
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: PopupMenuButton(
                                  icon: Icon(Icons.edit),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: Text("Edit Item Name"),
                                        value: 1),
                                    PopupMenuItem(
                                        child: Text("Delete Item"), value: 2)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: Get.height * 0.03,
                            width: Get.width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${controller.datalist[index]['dataPrice']}'),
                                Text(controller.count.toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       controller.queryPortion();
                    //     },
                    //     child: Text('click'))
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// j jkdfh lldlj
class ColorCategory extends StatelessWidget {
  const ColorCategory({
    required this.controller,
    required this.categoty,
    required this.color,
  });

  final DashboardController controller;
  final int color;
  final String categoty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.backColor.value = Color(0xff000000);
      },
      child: Container(
        height: Get.height * 0.04,
        width: Get.width * 0.08,
        decoration: BoxDecoration(
          color: Color(color),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
