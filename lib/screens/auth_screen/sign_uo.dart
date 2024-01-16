import 'package:expense_tracker/controller/balance_controller.dart';
import 'package:expense_tracker/screens/bottom_navbar.dart';
import 'package:expense_tracker/widgets/button.dart';
import 'package:expense_tracker/screens/navigation_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/balance.dart';
import '../../widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    BalanceController balanceController = BalanceController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.keyboard_backspace, )),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15, top: 60),
        child: Column(
          children: [
            customTextField(hint: "Name",controller: nameController,isPass: false),
            customTextField(hint: "Email",controller: emailController,isPass: false),
            customTextField(hint: "Password",controller: passController,isPass: true),
            CheckboxListTile(
              title: RichText(text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "By signing up, you agree to the ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        )
                    ),
                    TextSpan(
                        text: " Terms of Service and Privacy Policy",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7B61FF),
                        )
                    )
                  ]
              )),
              value: isAccepted,
              onChanged: (newValue) {
                setState(() {
                  isAccepted = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              //  <-- leading Checkbox
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: Color(0xFF7B61FF)
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              width: double.infinity,
                height: 60,
                child: customButton(onPress: (){}, color: const Color(0xFF7B61FF), title: "Sign Up", textColor: Colors.white)),
            Text("Or with", style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500, fontSize: 16),),
            Container(
                margin: const EdgeInsets.only(bottom: 10, top: 5),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    onPressed: ()async{
                      late final Balance? balance;
                      balance = await balanceController.getTotals();
                      if(balance.isNull){
                        BalanceController.income = 0;
                        BalanceController.expense=  0;
                        BalanceController.totalMoney=  0;
                      }else{
                        BalanceController.income = balance!.income ;
                        BalanceController.expense= balance.expense ;
                        BalanceController.totalMoney= balance.total;
                      }
                      Get.to(()=>const BottomBarScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.all(12),
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),side: BorderSide(color: Colors.grey.shade200)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/google.png", width: 35,),
                        const SizedBox(width: 10,),
                        const Text(
                          "Sign Up with Google",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 19),
                        ),
                      ],
                    )),),
            RichText(text:  TextSpan(
                children: [
                  TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      )
                  ),
                  const TextSpan(
                      text: " Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7B61FF),
                      )
                  )
                ]
            ))
          ],
        ),
      ),
    );
  }
}
