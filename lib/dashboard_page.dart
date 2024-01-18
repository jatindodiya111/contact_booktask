

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class dashboard_page extends StatefulWidget {
  const dashboard_page({super.key});

  @override
  State<dashboard_page> createState() => _dashboard_pageState();
}

class _dashboard_pageState extends State<dashboard_page> {

  final dio = Dio();

  Future getdata()
  async {
    // var url = Uri.parse('https://jdflutterapi.000webhostapp.com/dashboard.php');
    final response = await dio.get('https://jdflutterapi.000webhostapp.com/dashboard.php');
    log("${response}");
    // var response = await http.get(url);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 50,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(future: getdata(),builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done)
          {
             if(snapshot.hasData)
               {
                  return ListView.builder(itemBuilder: (context, index) {
                     return ListTile(title: Text(""),);
                  },);
               }
             else{
               return Center(child: CircularProgressIndicator(),);
             }
          }
        else
          {
              return Center(child: CircularProgressIndicator(),);
          }
      },)
    );
  }
}
