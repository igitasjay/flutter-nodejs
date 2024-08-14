import 'package:flutter/material.dart';

class CrudRead extends StatelessWidget {
  const CrudRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Data'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return null;

        // return showDisplay(index.toString(), price, description)
      }),
    );
  }
}

Widget showDisplay(String name, String price, String description) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
    ),
  );
}
