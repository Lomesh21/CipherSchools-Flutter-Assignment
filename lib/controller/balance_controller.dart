import '../model/balance.dart';
import '../services/totals_services.dart';

class BalanceController{
  late final Totals total;
  static int totalMoney =0;
  static int expense = 0;
  static int income =0;

  BalanceController(){
    total = Totals();
  }
  Future<Balance?> getTotals()async{
    return await total.getTotals(Totals.totals);
  }
  Future<void> setTotals (Balance balance) async{
     await total.setValue(Totals.totals, balance);
  }
}