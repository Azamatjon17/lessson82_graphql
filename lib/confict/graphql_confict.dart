import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlConfict {
  static HttpLink httpLink = HttpLink(
    'https://api.escuelajs.co/graphql/products',
  );

  static ValueNotifier<GraphQLClient> initilizeClient() {
    final Link link = httpLink;
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: link,
      ),
    );
  }
}
