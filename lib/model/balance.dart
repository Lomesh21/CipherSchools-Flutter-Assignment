import 'package:hive/hive.dart';
part 'balance.g.dart';
@HiveType(typeId: 1)
class Balance {
  @HiveField(0)
  int total;
  @HiveField(1)
  int income;
  @HiveField(2)
  int expense;
  Balance({required this.total,required this.income,required this.expense});
}