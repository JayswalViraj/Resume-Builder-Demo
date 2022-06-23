import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:resume_builder/models/resume_model.dart';
import 'package:resume_builder/utils/colors.dart';
import 'package:resume_builder/utils/global_data.dart';
import 'package:resume_builder/widgets/custome_text.dart';

class ViewResume extends StatefulWidget {
  
  ViewResume({Key? key}) : super(key: key);

  @override
  State<ViewResume> createState() => _ViewResumeState();
}

class _ViewResumeState extends State<ViewResume> {


final List<String> _items=["Name","Profession","Mobile No","E-Mail","Address"];
final List _itemsVal=[GlobalData.name.toString(),GlobalData.profession.toString(),GlobalData.mobile.toString(),GlobalData.email.toString(),GlobalData.address.toString()];
int index =0;
void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = _items.removeAt(oldIndex);
      _items.insert(newIdx, item);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Your Resume"),),
body: Center(child: 
Card(child:Container(height: 600,width: 350, child: Column(
crossAxisAlignment: CrossAxisAlignment.center,

  children: [

      GlobalData.pickedImage != null
                    ? Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 140,
                        child: Image.file(
                          File(GlobalData.pickedImage.toString()),
                          height: 200,
                        ))
                    : SizedBox(
                      height: 0,
                      
                        
                        ),
                        SizedBox(height: 10,),


                        
        Container(
          height: 300,
          child: ReorderableListView(
            onReorder: _onReorder,
            children: [
              for(int item=0 ;item<_items.length ; item++) ...[

              
              
            
              Row(
                  key: Key(item.toString()),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
               
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: CustomeText(color: Colors.black,text: _items[item].toString(),fontSize: 14,),
                    decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(20)),),
                  ),

              Expanded(
              
                child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child:  CustomeText(color: Colors.black,text:_itemsVal[item] ,fontSize: 14,),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),),
              ),
              
                ],
              ),

              ]
           
       
           
            ],
          ),
        ),

   
       

  ],
)),)),
    );
    
  }
}