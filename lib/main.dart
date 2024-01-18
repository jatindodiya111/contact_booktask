import 'package:contact_booktask/dashboard_page.dart';
import 'package:contact_booktask/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  bool error_message=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Login Page"),),
      body: Column(children: [
        SizedBox(height: 20,),
        TextField(controller: t1,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your UserName : "),),
        SizedBox(height: 20,),
        TextField(controller: t2,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "Enter Your Password : "),),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () async {
         //https://jdflutterapi.000webhostapp.com/login_page.php
          var url = Uri.parse('https://jdflutterapi.000webhostapp.com/login_page.php?username=${t1.text}&password=${t2.text}');
          var response = await http.get(url);
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');
          if(response.body!="You logged succesfully") {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return dashboard_page();
            },));
            setState(() {});
          }
          else
            {
              error_message=true;

                setState(() {});
            }
        }, child: Text("Submit")),
        SizedBox(height: 20,),
        (error_message)?Center(child: Text("Wrong Username or Password")):Text(""),
        SizedBox(height: 20,),
        TextButton(onPressed: () {

        }, child: Text("Forget Password")),
        SizedBox(height: 20,),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return register_page();
          },));
        }, child: Text("Register Your Account"))

      ]),
    );
  }
}


