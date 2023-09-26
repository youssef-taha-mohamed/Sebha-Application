import 'package:e_sebha/modules/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layout/sebha_layout.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_)=> MyProvider(),
      builder: (ctx, child) => const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: Provider.of<MyProvider>(context).tm,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
          primaryColor: Colors.black),
      home:const SebhaScreen(),
    );
  }
}
