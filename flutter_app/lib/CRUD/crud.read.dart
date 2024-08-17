import 'package:flutter/material.dart';
import 'package:flutter_app/model.product.dart';
import 'package:flutter_app/services/services.api.dart';

class CrudRead extends StatefulWidget {
  const CrudRead({super.key});

  @override
  State<CrudRead> createState() => _CrudReadState();
}

class _CrudReadState extends State<CrudRead> {
  // late Future<Product> futureProducts;
  final ApiProvider apiProvider = ApiProvider();
  List<Product> products = [];
  int page = 1;
  bool isLoading = false;

  // Future<void> fetchProducts() async {
  //   if (isLoading) return;
  //   setState(() {
  //     isLoading = true;
  //   });
  //   final fetchProducts = await apiProvider.read();
  //   setState(() {
  //     products.addAll(fetchProducts);
  //     page++;
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    apiProvider.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD - Read'),
      ),
      body: ListView.builder(
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          if (index == products.length) {
            return isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink();
          }
          final product = products[index];
          return ListTile(
            leading: const Icon(Icons.emoji_emotions_outlined),
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: Text(
              product.price.toString(),
            ),
          );
        },
      ),
    );
  }
}
