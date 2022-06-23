import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:resume_builder/pages/enter_detail_page.dart';
import 'package:resume_builder/utils/global_data.dart';
import 'package:resume_builder/utils/local_storage.dart/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


Future getShardPrefData() async{
 GlobalData.name=await SharedPref.stringGet(key: "name");
 debugPrint(GlobalData.name);
 GlobalData.profession=await SharedPref.stringGet(key: "profession");
 debugPrint(GlobalData.profession);
 GlobalData.mobile=await SharedPref.stringGet(key: "mobile");
 debugPrint(GlobalData.mobile);
 GlobalData.email=await SharedPref.stringGet(key: "email");
 debugPrint(GlobalData.email);
 GlobalData.address=await SharedPref.stringGet(key: "address");
 debugPrint(GlobalData.address);




   GlobalData.pickedImage=await SharedPref.stringGet(key: "i");
 debugPrint(GlobalData.pickedImage);

  
  
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
      getShardPrefData().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EnterDetailPage())));
  

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
body: Center(child: Text("Splash Screen")),
    );
    
  }
}