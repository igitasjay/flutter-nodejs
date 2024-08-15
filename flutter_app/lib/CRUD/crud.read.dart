import 'package:flutter/material.dart';
import 'package:flutter_app/model.product.dart';
import 'package:flutter_app/services/services.api.dart';

class CrudRead extends StatefulWidget {
  const CrudRead({super.key});

  @override
  State<CrudRead> createState() => _CrudReadState();
}

class _CrudReadState extends State<CrudRead> {
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiProvider().read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD - Read'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  leading: const Icon(Icons.insert_emoticon),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text("\$${product.price.toString()}"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
