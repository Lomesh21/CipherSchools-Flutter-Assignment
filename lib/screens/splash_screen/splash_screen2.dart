import 'package:expense_tracker/screens/auth_screen/sign_uo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreenS extends StatefulWidget {
  const SplashScreenS({Key? key}) : super(key: key);

  @override
  State<SplashScreenS> createState() => _SplashScreenSState();
}

class _SplashScreenSState extends State<SplashScreenS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF7B61FF),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(alignment: Alignment.topRight,child: Image.asset("assets/upper_cirlcle.png"),),
            Align(alignment: Alignment.bottomLeft,child: Image.asset("assets/lower_circle.png"),),
            Align(alignment: Alignment.topLeft,child: Padding(
              padding: EdgeInsets.only(left: 20, top: 70),
              child: Image.asset("assets/Logo.png", width: 80,),
            ),),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Welcome to", style: TextStyle(fontSize: 35 , color: Colors.white),),
                        SizedBox(height: 10,),
                        Image.asset("assets/CipherX.png")
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>SignUp());
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white54
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Text("The best way to track your expenses.", style: TextStyle(fontSize: 20, color: Colors.white),),
                SizedBox(
                  height: 50,
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
