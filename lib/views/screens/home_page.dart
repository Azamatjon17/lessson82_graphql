import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lessson82_graphql/controller/product_controller.dart';
import 'package:lessson82_graphql/models/product.dart';
import 'package:lessson82_graphql/views/widgets/add_product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: context.read<ProductController>().getProducts(),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List products = result.data!['products'];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(products[index]['title'].toString()),
                  subtitle: Text(products[index]['description'].toString()),
                  trailing: IconButton(
                    onPressed: () async {
                      await context.read<ProductController>().deleteProduct(int.parse(products[index]['id']));
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Product? product = await showProductDialog(context);
          if (product != null) {
            await context.read<ProductController>().addProduct(product);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
