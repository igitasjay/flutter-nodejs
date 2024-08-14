import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/services/services.api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApiProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
