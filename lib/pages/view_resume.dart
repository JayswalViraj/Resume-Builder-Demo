import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:resume_builder/models/resume_model.dart';
import 'package:resume_builder/utils/colors.dart';
import 'package:resume_builder/utils/global_data.dart';
import 'package:resume_builder/utils/responsive_data.dart';
import 'package:resume_builder/widgets/custome_text.dart';

class ViewResume extends StatefulWidget {
  ViewResume({Key? key}) : super(key: key);

  @override
  State<ViewResume> createState() => _ViewResumeState();
}

class _ViewResumeState extends State<ViewResume> {
  final List<String> _items = [
    "Name",
    "Profession",
    "Mobile No",
    "E-Mail",
    "Address"
  ];
  final List _itemsVal = [
    GlobalData.name.toString(),
    GlobalData.profession.toString(),
    GlobalData.mobile.toString(),
    GlobalData.email.toString(),
    GlobalData.address.toString()
  ];
  int index = 0;
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;

      final item = _items.removeAt(oldIndex);
      _items.insert(newIdx, item);
      final itemVal = _itemsVal.removeAt(oldIndex);

      _itemsVal.insert(newIdx, itemVal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Resume"),
        backgroundColor: primaryColor,
      ),
      body: Center(
          child: Card(
        child: Container(
            height: SizeConfig.heightMultiplier * 60,
            width: SizeConfig.widthMultiplier * 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                GlobalData.pickedImage != null
                    ?  kIsWeb==true? Container(height: SizeConfig.heightMultiplier*18, child: Image.network(GlobalData.pickedImage.toString())):  CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            FileImage(File(GlobalData.pickedImage.toString())))
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 40,
                  child: ReorderableListView(
                    onReorder: _onReorder,
                    children: [
                      for (int item = 0; item < _items.length; item++) ...[
                        _itemsVal[item] == "" || _itemsVal[item] == null
                            ? SizedBox(
                                height: 0,
                                key: Key(item.toString()),
                              )
                            : Row(
                                key: Key(item.toString()),
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          SizeConfig.heightMultiplier),
                                      margin: EdgeInsets.only(
                                          left:
                                              SizeConfig.heightMultiplier * 1.5,
                                          top: SizeConfig.heightMultiplier *
                                              1.5),
                                      child: CustomeText(
                                        color: Colors.black,
                                        text: _items[item].toString(),
                                        fontSize:
                                            SizeConfig.heightMultiplier * 2,
                                      ),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          SizeConfig.heightMultiplier),
                                      margin: EdgeInsets.only(
                                          left:
                                              SizeConfig.heightMultiplier * 1.5,
                                          top: SizeConfig.heightMultiplier *
                                              1.5),
                                      child: CustomeText(
                                        color: Colors.black,
                                        text: _itemsVal[item],
                                        fontSize:
                                            SizeConfig.heightMultiplier * 2,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ],
                              ),
                      ]
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
