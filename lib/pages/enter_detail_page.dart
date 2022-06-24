import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:resume_builder/models/resume_model.dart';
import 'package:resume_builder/pages/view_resume.dart';
import 'package:resume_builder/utils/colors.dart';
import 'package:resume_builder/utils/global_data.dart';
import 'package:resume_builder/utils/local_storage.dart/shared_pref.dart';
import 'package:resume_builder/utils/responsive_data.dart';

import '../widgets/custome_text.dart';

class EnterDetailPage extends StatefulWidget {
  const EnterDetailPage({Key? key}) : super(key: key);

  @override
  State<EnterDetailPage> createState() => _EnterDetailPageState();
}

class _EnterDetailPageState extends State<EnterDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     pickedImage = null;
                          GlobalData.pickedImage = null;
                          setState(() {});
  }

  ResumeModel object = ResumeModel();

  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Resume Builder"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: SizeConfig.widthMultiplier * 5,
              right: SizeConfig.widthMultiplier * 5),
          child: Column(
            children: [
              //File file = File(videofile.path);
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalData.pickedImage != null
                      ? Container(
                          margin:
                              EdgeInsets.only(top: SizeConfig.heightMultiplier),
                          height: SizeConfig.heightMultiplier * 22,
                          child: kIsWeb == false
                              ? Image.file(
                                  File(GlobalData.pickedImage.toString()),
                                  height: SizeConfig.heightMultiplier * 22,
                                )
                              : Image.network(
                                
                                  GlobalData.pickedImage.toString()))
                      : Container(
                          height: SizeConfig.heightMultiplier * 25,
                          child: Image.asset("assets/images/default.png")),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          pickedImage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          GlobalData.pickedImage = pickedImage!.path.toString();

                          await SharedPref.stringSave(
                              key: "i", value: GlobalData.pickedImage);
                          GlobalData.pickedImage =
                              await SharedPref.stringGet(key: "i");
                          setState(() {});
                        },
                        child: Container(
                          width: SizeConfig.widthMultiplier * 30,
                          padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                          margin: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 2,
                              top: SizeConfig.heightMultiplier * 2),
                          child: Center(
                              child: CustomeText(
                            color: Colors.black,
                            text: "Add Image",
                            fontSize: SizeConfig.heightMultiplier * 2,
                          )),
                          decoration: BoxDecoration(
                              color: addBottonColor,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          pickedImage = null;
                          GlobalData.pickedImage = null;
                          setState(() {});
                        },
                        child: Container(
                          width: SizeConfig.widthMultiplier * 30,
                          padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                          margin: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 2,
                              top: SizeConfig.heightMultiplier * 2),
                          child: Center(
                              child: CustomeText(
                            color: Colors.black,
                            text: "Remove",
                            fontSize: SizeConfig.heightMultiplier * 2,
                          )),
                          decoration: BoxDecoration(
                              color: removeBottonColor,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),

              textFieldWidet(initialValue: GlobalData.name, lableText: "Name"),

              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              textFieldWidet(
                  initialValue: GlobalData.profession, lableText: "Profession"),

              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),

              textFieldWidet(
                  initialValue: GlobalData.mobile, lableText: "Mobile No"),

              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),

              textFieldWidet(
                  initialValue: GlobalData.email, lableText: "E-Mail"),

              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),

              textFieldWidet(
                  initialValue: GlobalData.address, lableText: "Address"),

              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),

              Row(
                children: [
                  Expanded(
                    child: PushableButton(
                      child: CustomeText(
                        text: "Save Data",
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      height: SizeConfig.heightMultiplier * 7,
                      elevation: 8,
                      hslColor: HSLColor.fromColor(Colors.orangeAccent),
                      shadow: BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                      onPressed: () async {
                        await SharedPref.stringSave(
                            key: "name", value: GlobalData.name);
                        GlobalData.name =
                            await SharedPref.stringGet(key: "name");

                        await SharedPref.stringSave(
                            key: "profession", value: GlobalData.profession);
                        GlobalData.profession =
                            await SharedPref.stringGet(key: "profession");

                        await SharedPref.stringSave(
                            key: "mobile", value: GlobalData.mobile);
                        GlobalData.mobile =
                            await SharedPref.stringGet(key: "mobile");

                        await SharedPref.stringSave(
                            key: "email", value: GlobalData.email);
                        GlobalData.email =
                            await SharedPref.stringGet(key: "email");

                        await SharedPref.stringSave(
                            key: "address", value: GlobalData.address);
                        GlobalData.address =
                            await SharedPref.stringGet(key: "address");

                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 4,
                  ),
                  Expanded(
                    child: PushableButton(
                      child: CustomeText(
                        text: "View Resume",
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      height: SizeConfig.heightMultiplier * 7,
                      elevation: 8,
                      hslColor: HSLColor.fromColor(Colors.orangeAccent),
                      shadow: BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewResume()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFieldWidet({String? initialValue, String? lableText}) {
    return TextFormField(
      minLines: lableText == "Address" ? 4 : null,
      maxLines: lableText == "Address" ? 5 : null,
      initialValue:
          initialValue!.isEmpty || initialValue == "null" ? "" : initialValue,
      onChanged: ((value) {
        switch (lableText) {
          case "Name":
            GlobalData.name = value;
            break;
          case "Profession":
            GlobalData.profession = value;
            break;
          case "Mobile No":
            GlobalData.mobile = value;
            break;
          case "E-Mail":
            GlobalData.email = value;
            break;
          case "Address":
            GlobalData.address = value;
            break;
        }
      }),
      decoration: InputDecoration(
        labelText: lableText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
