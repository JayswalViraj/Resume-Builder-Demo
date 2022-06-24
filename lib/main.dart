import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder/pages/enter_detail_page.dart';
import 'package:resume_builder/pages/splash_screen.dart';
import 'package:resume_builder/utils/global_data.dart';
import 'package:resume_builder/utils/local_storage.dart/shared_pref.dart';
import 'package:resume_builder/utils/responsive_data.dart';

void main() async{


    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);  
  runApp(LayoutBuilder(
    builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
           SizeConfig().init(constraints, orientation);
          return MaterialApp(home: SplashScreen(),debugShowCheckedModeBanner: false,);
        }
      );
    }
  ));
}

