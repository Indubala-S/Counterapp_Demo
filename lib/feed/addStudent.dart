import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Addstudent extends StatelessWidget {
  Addstudent({super.key});

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController college = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  Future<void> sendData() async {
    final url = Uri.parse(
        "https://logix-space-course-app-1.onrender.com/addstudents");
    try {
      final response = http.post(url,
          headers: {"Content-Type": "application/json",},
          body: jsonEncode({
            "firstname": fname.text,
            "lastname": lname.text,
            "college": college.text,
            "dob": dob.text,
            "course": course.text,
            "mobile": mobile.text,
            "email": email.text,
            "address": address.text
          })
      );
    }
    catch (e) {
      print(e);
    }
  }

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: fname,
                    decoration: InputDecoration(
                        labelText: "Firstname", hintText: "Enter the first name",
                        icon: Icon(Icons.person_add_alt_1_outlined),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: lname,
                    decoration: InputDecoration(
                        labelText: "Lastname", hintText: "Enter the last name",
                        icon: Icon(Icons.person_add_alt_1_outlined),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: college,
                    decoration: InputDecoration(
                        labelText: "College name",
                        hintText: "Enter the college name",
                        icon: Icon(Icons.add_home_work_outlined),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: dob,
                    decoration: InputDecoration(
                        labelText: "Date of Birth",
                        hintText: "Enter the date of birth",
                        icon: Icon(Icons.date_range_rounded),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: course,
                    decoration: InputDecoration(
                        labelText: "Current Course",
                        hintText: "Enter the course name",
                        icon: Icon(Icons.book_outlined),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: mobile,
                    decoration: InputDecoration(
                        labelText: "Mobile Number",
                        hintText: "Enter the mobile number",
                        icon: Icon(Icons.phone_android_rounded),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "Enter the email",
                        icon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: address,
                    decoration: InputDecoration(
                        labelText: "Address", hintText: "Enter the address",
                        icon: Icon(Icons.add_home),
                        border: OutlineInputBorder()

                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero
                          ),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white
                      ),
                      onPressed: () async{
                        await sendData();
                      },
                      child: Text("Submit", style: TextStyle(
                        color: Colors.white, fontSize: 20.0,),),),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Clickeyyyy");
                    },
                    child: Text("click here"),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
