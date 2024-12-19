import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Viewallstudent extends StatefulWidget {
  const Viewallstudent({super.key});

  @override
  State<Viewallstudent> createState() => _ViewallstudentState();
}

class _ViewallstudentState extends State<Viewallstudent> {
  List<Map<String,dynamic>> student=[

  ];
  Future<void> fetchStudentData() async{
    final apiurl=Uri.parse("https://logix-space-course-app-1.onrender.com/getdata");
    try{
      final response= await http.get(apiurl);
      if(response.statusCode== 200){
        List data=json.decode(response.body);
        setState(() {
          student= List<Map<String,dynamic>>.from(data);
        });
        print("API called succesfully");
      }else{
       throw Exception("kindibakka's API Data failed");
      }
    }
    catch(exception){
     print(exception);
    }
  }
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudentData();
  }
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: student.length,
      itemBuilder: (context,index)
      {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(student[index]["firstname"]),
            subtitle: Text(
                student[index]["lastname"]+"\n"+
                    student[index]["college"]+"\n"+
                    student[index]["dob"]+"\n"+
                    student[index]["course"]+"\n"+
                    student[index]["mobile"]+"\n"+
                    student[index]["email"]+"\n"+
                    student[index]["address"]
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://st2.depositphotos.com/5593754/8693/v/950/depositphotos_86930520-stock-illustration-information-book-icon.jpg"),
            ),
          ),
        );
      },);
  }
}


