import 'dart:math';

import 'package:expense_tracker/const/color.dart';
import 'package:expense_tracker/const/image.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFAD61FF),
                    radius: 50,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 43,
                        backgroundImage: AssetImage("assets/profile.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Username",style: TextStyle(fontSize: 14, color: Colors.grey.shade400, fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text("Rahul Sharma",style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),)
                    ],
                  ),
                  Spacer(),
                  Image.asset("assets/edit.png",)
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70
                  ),
                  child: Column(
                    children: [
                      profileWidget(title: "Account", image: wallet, color: lightVioletColor,),
                      Divider(
                        thickness: 0.7,
                        color: Colors.grey.shade200,
                      ),
                      profileWidget(title: "Settings", image: setting, color: lightVioletColor,),
                      Divider(
                        thickness: 0.7,
                        color: Colors.grey.shade400,

                      ),
                      profileWidget(title: "Export Data", image: upload, color: lightVioletColor,),
                      Divider(
                        thickness: 0.6,
                        color: Colors.grey.shade300,
                      ),
                      profileWidget(title: "Logout", image: logout, color: lightRedColor,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class profileWidget extends StatelessWidget {
  const profileWidget({
    super.key, required this.title, required this.image, required this.color,
  });
  final String title;
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(left: 10,right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color,
            ),
            child: Image.asset(image,width: 25,),
          ),
          Text(title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
