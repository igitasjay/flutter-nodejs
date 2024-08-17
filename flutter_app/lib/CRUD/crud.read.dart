import 'package:flutter/material.dart';
import 'package:flutter_app/model.product.dart';
import 'package:flutter_app/services/services.api.dart';

class CrudRead extends StatefulWidget {
  const CrudRead({super.key});

  @override
  CrudReadState createState() => CrudReadState();
}

class CrudReadState extends State<CrudRead> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiProvider().read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('${product.description} - \$${product.price}'),
                  onTap: () {
                    // Handle tap on product item, e.g., navigate to a details page
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
