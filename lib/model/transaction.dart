import 'package:hive/hive.dart';
part 'transaction.g.dart';
@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  String category;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subtitle;
  @HiveField(3)
  String transaction;
  @HiveField(4)
  String time;
  @HiveField(5)
  bool isExpense;

  Transaction({required this.title,required this.category,required this.transaction, required this.isExpense, required this.subtitle, required this.time});
}