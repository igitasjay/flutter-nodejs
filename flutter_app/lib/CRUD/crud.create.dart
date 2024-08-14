import 'package:flutter/material.dart';
import 'package:flutter_app/services/services.api.dart';
import 'package:flutter_app/util/util.inputfield.dart';
import 'package:flutter_app/util/util.spacing.dart';
import 'package:provider/provider.dart';

class CrudCreate extends StatefulWidget {
  const CrudCreate({super.key});

  @override
  State<CrudCreate> createState() => _CrudCreateState();
}

class _CrudCreateState extends State<CrudCreate> {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiProvider>(context, listen: false);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD - Create"),
      ),
      body: api.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                        InputField(
                            label: "Description", controller: descController),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        final api = ApiProvider();
                        api.create(
                          nameController.text,
                          double.parse(priceController.text),
                          descController.text,
                        );
                      },
                      child: const Text("CREATE"),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
