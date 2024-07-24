import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lessson82_graphql/confict/graphql_confict.dart';
import 'package:lessson82_graphql/core/constants/graphql_queries.dart';
import 'package:lessson82_graphql/models/product.dart';

class ProductController extends ChangeNotifier {
  final client = GraphqlConfict.initilizeClient();

  QueryOptions getProducts() {
    return QueryOptions(document: gql(fetchProducts));
  }

  Future<void> addProduct(Product product) async {
    await client.value.mutate(
      MutationOptions(
        document: gql(createProduct),
        variables: {
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'categoryId': 1.0,
          'images': ['https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png'],
        },
      ),
    );
    notifyListeners();
  }

  Future<void> deleteProduct(int id) async {
    await client.value.mutate(
      MutationOptions(
        document: gql("""
          mutation {
            deleteProduct(id: $id)
          }
        """),
      ),
    );
    notifyListeners();
  }
}
