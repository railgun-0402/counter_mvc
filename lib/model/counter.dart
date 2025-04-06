import 'package:flutter/cupertino.dart';

/// カウンターの振る舞いを表現
class Counter extends ChangeNotifier {

  int get count => _count;

  List<int> get counts => _counts;

  /// カウント値
  int _count = 0;

  /// カウント値のリスト
  final List<int> _counts = [];

  /// インクリメント
  void increment() {
    _count++;
    notifyListeners();
  }

  /// リスト追加
  void append(int value) {
    _counts.add(value);
    notifyListeners();
  }

  /// 合計値
  int calculateTotal() {
    return _counts.fold(0, (a, b) => a + b);
  }

  /// クリア
  void clear() {
    _count = 0;
    _counts.clear();
    notifyListeners();
  }

  /// カウント値の合計が 5 の倍数であるかを判定する。
  bool isTotalMultipleOfFive() => calculateTotal() % 5 == 0;
}

