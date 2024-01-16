import 'package:hive/hive.dart';

class Totals{
  static const totalsBox = '_totalsBox';
  static const totals ='totals';
  late final Box<dynamic> _box;
  Totals(){
    _box = Hive.box(totalsBox);
  }

  Future<T> getTotals<T>(Object key, {T? defaultValue})async{
    return await _box.get(key,defaultValue: defaultValue);
  }
  Future<void> setValue<T>(Object key, T value)async => await _box.put(key, value);

  Future<void> deleteValue<T>(Object key) async => await _box.delete(key);

  Future<void> clearAll() async=> await _box.clear();
}