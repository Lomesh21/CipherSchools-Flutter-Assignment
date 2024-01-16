

import 'package:expense_tracker/controller/balance_controller.dart';
import 'package:expense_tracker/screens/navigation_pages/budget.dart';
import 'package:expense_tracker/const/color.dart';
import 'package:expense_tracker/const/image.dart';
import 'package:expense_tracker/screens/navigation_pages/income.dart';
import 'package:expense_tracker/screens/navigation_pages/profile.dart';
import 'package:expense_tracker/screens/navigation_pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../controller/transaction_controller.dart';
import 'navigation_pages/Expense.dart';
import 'navigation_pages/home.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final TransactionController transactionController = TransactionController();
  final BalanceController balanceController = BalanceController();
  final List<Map<String, Widget>> _pages= [
    {
      'page': Home(),
    },
    {
      'page': const TransactionPage(),
    },
    {
      'page': const BudgetPage(),
    },
    {
      'page': const ProfilePage(),
    },
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SpeedDial(
          direction: SpeedDialDirection.values[3],
          child: Icon(Icons.add_rounded, size: 45,color: Colors.white,),
          backgroundColor: violetColor,
          spaceBetweenChildren: 10,
          children: [
            SpeedDialChild(
                onTap: (){
                  Get.to(()=>IncomeScreen(action:transactionController.addTransaction,action2 :balanceController.setTotals));
                },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/income.png"),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)
              )
            ),
            SpeedDialChild(
              onTap: (){
                Get.to(()=> ExpenseScreen(action:transactionController.addTransaction,action2 :balanceController.setTotals));
              },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/expense.png"),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFFFCFCFC),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: (){
                _selectPage(0);
              },
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(_selectedPageIndex==0?homeColored:homeGrey),
                  Text("Home", style: TextStyle(color: _selectedPageIndex==0?violetColor:Colors.grey.shade400, fontSize: 12),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _selectPage(1);
              },
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(transaction),
                  Text("Transaction", style: TextStyle(color: Colors.grey.shade400, fontSize: 12),)
                ],
              ),
            ),
            const SizedBox(width: 10,),
            InkWell(
              onTap: (){
                _selectPage(2);
              },
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(budget),
                  Text("Budget",style: TextStyle(color: Colors.grey.shade400, fontSize: 12),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _selectPage(3);
              },
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(_selectedPageIndex==3?profileColored:profileGrey),
                  Text("Profile",style: TextStyle(color: _selectedPageIndex==3?violetColor:Colors.grey.shade400, fontSize: 12),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}