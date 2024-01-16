import 'package:expense_tracker/const/color.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/screens/bottom_navbar.dart';
import 'package:expense_tracker/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import '../../const/image.dart';
import '../../controller/balance_controller.dart';
import '../../model/balance.dart';
import '../../model/transaction.dart';
import '../../widgets/button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key, required this.action, required this.action2}) : super(key: key);
  final Function(Transaction) action;
  final Function(Balance) action2;
  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  TextEditingController moneyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> categories = ["Shopping", "Subscription", "Travel", "Food"];
  List<String> images = [Shopping, Subscription, Travel, Food];
  List<String> wallet = ["PayTM", "GPay", "Cash", "PhonePe"];
  String category = "Category";
  String wallets = "Wallet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: expenseScreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Income",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "How much?",
                    style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextFormField(
                  controller: moneyController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                      isDense: true,
                      fillColor: null,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: "0",
                      prefixIcon: Icon(
                        Icons.currency_rupee,
                        size: 70,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white, fontSize: 70)),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          DropDownWidget(
                            title: category,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                      title: Text("Category",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      actions: List.generate(
                                          categories.length,
                                              (index) => ListTile(
                                            leading: Image.asset(
                                              images[index],
                                              width: 30,
                                            ),
                                            title: Text(
                                              categories[index],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                category =
                                                categories[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                          ))));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              onChanged: (value){

                              },
                              controller: descriptionController,
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                  isDense: true,
                                  fillColor: null,
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 19)),
                            ),
                          ),
                          DropDownWidget(
                            title: 'Wallet',
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                      title: Text("Wallet",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      actions: List.generate(
                                          wallet.length,
                                              (index) => ListTile(
                                            title: Text(
                                              wallet[index],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                wallets =
                                                wallet[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                          ))));
                            },
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        width: double.infinity,
                        height: 60,
                        child: customButton(
                            onPress: moneyController.toString().isEmpty || moneyController.toString() == '0'?
                            SnackBar(content: Text("Fill the details",style: TextStyle(color: Colors.white),),backgroundColor: redColor,):
                                ()async{
                              final transaction = Transaction(title: category, category: category, transaction: moneyController.text, isExpense: true, subtitle: descriptionController.text, time: DateFormat('hh:mm a').format(DateTime.now()));
                              await widget.action(transaction);
                              BalanceController.expense+= int.parse(moneyController.text);
                              BalanceController.totalMoney-=int.parse(moneyController.text);
                              final totals = Balance(total: BalanceController.totalMoney, income: BalanceController.income, expense: BalanceController.expense);
                              await widget.action2(totals);
                              Get.off(BottomBarScreen());
                            },
                            color: incomeScreen,
                            title: "Continue",
                            textColor: Colors.white)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
