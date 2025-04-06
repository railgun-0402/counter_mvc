import 'package:counter_mvc/model/counter.dart';
import 'package:flutter/material.dart';

/// ユーザーによる操作を解釈しモデルを操作・モデルを UI に反映
class CounterController {
  const CounterController(Counter counter) : _counter = counter;

  /// Model
  final Counter _counter;

  /// カウントアップボタン押下時
  void countUp() => _counter.increment();

  /// リスト追加ボタン押下時
  void addToList(BuildContext context) {
    _counter.append();
    final total = _counter.calculateTotal();
    if(_counter.isTotalMultipleOfFive())  {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('合計値: $total は5の倍数です！'),
        ),
      );
    }
  }

  /// クリアボタン押下時
  void clear() => _counter.clear();
}