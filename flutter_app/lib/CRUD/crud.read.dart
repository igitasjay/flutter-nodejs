import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model.product.dart';
import 'package:flutter_app/services/services.api.dart';

class CrudRead extends StatelessWidget {
  const CrudRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD - Read'),
      ),
      body: FutureBuilder(
        future: ApiProvider().read(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            List<ProductModel> product = snapshot.data;
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.insert_emoticon),
                  title: Text(product[index].name!),
                  subtitle: Text(product[index].desc!),
                  trailing: Text("\$${product[index].price.toString()}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
