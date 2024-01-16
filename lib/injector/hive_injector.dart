
import 'package:expense_tracker/model/balance.dart';
import 'package:expense_tracker/model/transaction.dart';
import 'package:expense_tracker/services/store.dart';
import 'package:expense_tracker/services/totals_services.dart';
import 'package:hive_flutter/adapters.dart';

class HiveInjector {
  static Future<void> setup()async{
    await Hive.initFlutter();
    _registerAdapters();
    await Hive.openBox(Store.storeBox);
    await Hive.openBox(Totals.totalsBox);
  }
  static void _registerAdapters(){
    Hive.registerAdapter(TransactionAdapter());
    Hive.registerAdapter(BalanceAdapter());
  }
}