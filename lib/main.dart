import 'package:counter_mvc/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/counter_controller.dart';
import 'model/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ProxyProvider<Counter, CounterController>(
          update: (_, counter, __) => CounterController(counter),
        ),
      ],
      child: MaterialApp(
        title: 'Counter MVC',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const CounterPage(),
      ),
    );
  }
}
