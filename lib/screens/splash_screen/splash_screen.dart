import 'package:expense_tracker/screens/splash_screen/splash_screen2.dart';
import 'package:flutter/material.dart';
import '../auth_screen/sign_uo.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>SplashScreenS());
    });
    // auth.authStateChanges().listen((User ? user) {
    //   if(user==null && mounted){
    //     Get.to(()=>Login());
    //   }else{
    //     Get.to(()=>Home());
    //   }
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
  }

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
            Align(alignment: Alignment.center,child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Logo.png"),
                const SizedBox(height: 30,),
                Image.asset("assets/CipherX.png")
              ],
            ),),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("By", style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),),
                  RichText(text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Open Source",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        )
                      ),
                      TextSpan(
                        text: " Community",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.orangeAccent,
                        )
                      )
                    ]
                  )),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
