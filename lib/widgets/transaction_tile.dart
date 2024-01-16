import 'package:flutter/material.dart';

import '../const/color.dart';
import '../const/image.dart';
class TransactionTiles extends StatelessWidget {
  TransactionTiles({
    super.key,
    required this.title,
    required this.subtitle,
    required this.transaction,
    required this.time,
    required this.isExpense,
    required this.category,
  });
  final String title;
  final String subtitle;
  final String transaction;
  final String time;
  final String category;
  final bool isExpense;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFFFCFCFC),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: decideColorFunc(category: category)),
            child: Image.asset(
              decideIconFunc(category: category),
              width: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isExpense ? "- ₹$transaction" : "+ ₹$transaction",
                style: TextStyle(
                    fontSize: 16,
                    color: isExpense ? redColor : greenColor,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                time,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


Color decideColorFunc({required String category}) {
  switch (category) {
    case 'Shopping':
      return lightGoldenColor;
    case 'Subscription':
      return lightVioletColor;
    case 'Food':
      return lightRedColor;
    case 'Travel':
      return lightBlueColor;
    default:
      return Colors.white;
  }
}

String decideIconFunc({required String category}) {
  switch (category) {
    case 'Shopping':
      return Shopping;
    case 'Subscription':
      return Subscription;
    case 'Food':
      return Food;
    case 'Travel':
      return Travel;
    default:
      return '';
  }
}
