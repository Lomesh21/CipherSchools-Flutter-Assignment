import 'package:expense_tracker/const/color.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/model/balance.dart';
import 'package:expense_tracker/widgets/income_expense.dart';
import 'package:expense_tracker/widgets/tile_widget.dart';
import 'package:expense_tracker/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

import '../../controller/balance_controller.dart';
import '../../model/transaction.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  final BalanceController totalController = BalanceController();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    final TransactionController transactionController = TransactionController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32)),
                  color: Color(0xFFFFF6E5)),
              padding: EdgeInsets.only(
                  bottom: 20, top: MediaQuery.of(context).size.height / 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xFFAD61FF),
                          radius: 25,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/profile.jpg"),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/arrow down 2.png",
                              color: const Color(0xFF7B61FF),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "October",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                        Image.asset("assets/notifiaction.png")
                      ],
                    ),
                  ),
                  Text(
                    "Account Balance",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "₹${BalanceController.totalMoney}",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IncomeExpenseWidget(
                        isExp: false,
                        total: BalanceController.income.toString(),
                      ),
                      IncomeExpenseWidget(
                        isExp: true,
                        total: BalanceController.expense.toString(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TileWidget(
                    title: 'Today',
                    isOff: false,
                  ),
                  TileWidget(
                    title: 'Week',
                    isOff: true,
                  ),
                  TileWidget(
                    isOff: true,
                    title: 'Month',
                  ),
                  TileWidget(
                    title: 'Year',
                    isOff: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFEEE5FF)),
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 14,
                          color: violetColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            FutureBuilder<List<Transaction>?>(future: transactionController.getTransaction(),
                builder: (context,snapshot) {
              if(snapshot.hasData){
                final List<Transaction> transactions = snapshot.data??[];
                if(transactions.isEmpty){
                  return const Center(
                    child: Text('No Transactions'),
                  );
                }
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(transactions.length, (index) {
                      var item = transactions[index].time;
                      return Dismissible(
                          key: Key(item),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction)async{
                            await transactionController.deleteTransaction(transactions[index]);
                            setState(() {
                              transactions.removeAt(index);
                            });
                          },
                          background: Card(
                            color: redColor,
                            child: Icon(Icons.delete, color: Colors.white,),
                          ),
                          child: TransactionTiles(
                              title: transactions[index].title,
                              subtitle: transactions[index].subtitle,
                              transaction: transactions[index].transaction,
                              time: transactions[index].time,
                              isExpense: transactions[index].isExpense,
                              category: transactions[index].category));
                    }));
              }
              if(snapshot.hasError){
                return Center(
                  child: Text("No Transaction", textAlign: TextAlign.center,),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),

          ],
        ),
      ),
    );
  }
}




