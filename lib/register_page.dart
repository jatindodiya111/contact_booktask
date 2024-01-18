import 'dart:io';

import 'package:contact_booktask/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'dashboard_page.dart';

class register_page extends StatefulWidget {
  const register_page({super.key});

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? photo;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  String image1="img1.jpg";
  bool t=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("Login Page"),),resizeToAvoidBottomInset: false,body: Column(children: [
      SizedBox(height: 20,),
      TextField(controller: t1,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your Full Name : ",labelText: "Enter Your Name"),),
      SizedBox(height: 20,),
      TextField(controller: t2,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your Contact : ",labelText: "Enter Your Contact"),),
      SizedBox(height: 20,),
      TextField(controller: t3,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your Username : ",labelText: "Enter Your Username"),),
      SizedBox(height: 20,),
      TextField(controller: t4,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your Password : ",labelText: "Enter Your Password "),),
      SizedBox(height: 20,),
      TextField(controller: t5,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your City : ",labelText: "Enter Your City"),),
      SizedBox(height: 20,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        ElevatedButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(title: Text("Choose a option for Image"),
            actions: [
              TextButton(onPressed: () async {
                image = await picker.pickImage(source: ImageSource.gallery);
                t=true;
                Navigator.pop(context);
                }, child: Text("Gallery")),
              TextButton(onPressed: () async {
                photo = await picker.pickImage(source: ImageSource.camera);
                t=true;
                Navigator.pop(context);
              }, child: Text("Camera")),
            ],
            );
          },);
        }, child:Text("Choose")),
        (t)?Container(height: 100,width: 100,color: Colors.blue,child: Image.file(File(image!.path)),):Text("Blank")
      ],),
      ElevatedButton(onPressed: () async {
        var url = Uri.parse('https://jdflutterapi.000webhostapp.com/index.php?name=${t1.text}&contact=${t2.text}&username=${t3.text}&password=${t4.text}&city=${t5.text}&image=$image1');
        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        Navigator.push(context, MaterialPageRoute(builder: (context)  {
          return homepage();
        },));
      }, child: Text("Register"))
    ],));
  }
}
