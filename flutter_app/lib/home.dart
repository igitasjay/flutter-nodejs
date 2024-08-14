import 'package:flutter/material.dart';
import 'package:flutter_app/CRUD/crud.create.dart';
import 'package:flutter_app/CRUD/crud.read.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CrudCreate(),
                      ));
                },
                child: const Text("CREATE")),
            const SizedBox(height: 24),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CrudRead(),
                    ),
                  );
                },
                child: const Text("READ")),
            const SizedBox(height: 24),
            FilledButton(onPressed: () {}, child: const Text("UPDATE")),
            const SizedBox(height: 24),
            FilledButton(onPressed: () {}, child: const Text("DELETE")),
          ],
        ),
      ),
    );
  }
}
