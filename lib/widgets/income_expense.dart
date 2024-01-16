import 'package:flutter/material.dart';

import '../const/color.dart';


class IncomeExpenseWidget extends StatelessWidget {
  const IncomeExpenseWidget({
    super.key,
    required this.isExp,
    required this.total,
  });
  final bool isExp;
  final String total;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      decoration: BoxDecoration(
          color: !isExp ? greenColor : redColor,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(8),
            child: Image.asset(
                !isExp ? "assets/income.png" : "assets/expense.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  !isExp ? "Income" : "Expenses",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "₹$total",
                  style: const TextStyle(
                      fontSize: 22,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}