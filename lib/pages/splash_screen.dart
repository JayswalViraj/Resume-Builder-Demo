import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resume_builder/pages/enter_detail_page.dart';
import 'package:resume_builder/utils/colors.dart';
import 'package:resume_builder/models/global_data.dart';
import 'package:resume_builder/utils/local_storage.dart/shared_pref.dart';
import 'package:resume_builder/utils/responsive_data.dart';
import 'package:resume_builder/widgets/custome_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getShardPrefData() async {
    GlobalData.name = await SharedPref.stringGet(key: "name") ?? "";
    debugPrint(GlobalData.name);
    GlobalData.profession = await SharedPref.stringGet(key: "profession") ?? "";
    debugPrint(GlobalData.profession);
    GlobalData.mobile = await SharedPref.stringGet(key: "mobile") ?? "";
    debugPrint(GlobalData.mobile);
    GlobalData.email = await SharedPref.stringGet(key: "email") ?? "";
    debugPrint(GlobalData.email);
    GlobalData.address = await SharedPref.stringGet(key: "address") ?? "";
    debugPrint(GlobalData.address);
    GlobalData.pickedImage = await SharedPref.stringGet(key: "i") ?? "";
    debugPrint(GlobalData.pickedImage);
  }

  @override
  void initState() {
   
    super.initState();
    Timer(const Duration(seconds: 10), () {
      getShardPrefData().then((value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const EnterDetailPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 13,
            child: Image.asset("assets/images/cv.png"),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1,
          ),
          CustomeText(
            text: "Simple Resume Builder",
            color: primaryColor,
            fontSize: SizeConfig.heightMultiplier * 3,
            fontWeight: FontWeight.w500,
          ),
        ],
      )),
    );
  
  
  
 
 
  }
}
