import 'package:expense_tracker/model/transaction.dart';

import '../services/store.dart';

class TransactionController{
  late final Store store;
  static int income=0;
  static int expense =0;
  static int total =0;
  TransactionController(){
    store = Store();
  }
  Future<List<Transaction>?> getTransaction () async{
    return List<Transaction>.from(await store.getValue(Store.transaction));
  }
  Future<void> addTransaction (Transaction transaction) async{
    final List<Transaction> transactions = List<Transaction>.from(await store.getValue(Store.transaction)??[]);
    transactions.add(transaction);
    await store.setValue(Store.transaction, transactions);
  }
  Future<void> deleteTransaction (Transaction transaction) async{
    final List<Transaction> transactions = List<Transaction>.from(await store.getValue(Store.transaction)??[]);
    transactions.remove(transaction);
    await store.setValue(Store.transaction, transactions);
  }

}