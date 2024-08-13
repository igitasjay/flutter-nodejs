import 'package:flutter/material.dart';
import 'package:flutter_app/util/util.inputfield.dart';
import 'package:flutter_app/util/util.spacing.dart';

class CrudCreate extends StatelessWidget {
  const CrudCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD - Create"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  InputField(label: "Name", controller: nameController),
                  height(14),
                  InputField(label: "Price", controller: priceController),
                  height(14),
                  InputField(label: "Description", controller: descController),
                ],
              ),
            ),
            SizedBox(
                width: double.infinity,
                child:
                    FilledButton(onPressed: () {}, child: const Text("CREATE")))
          ],
        ),
      ),
    );
  }
}
