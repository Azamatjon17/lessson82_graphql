import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lessson82_graphql/confict/graphql_confict.dart';
import 'package:lessson82_graphql/controller/product_controller.dart';
import 'package:lessson82_graphql/views/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter(); // Initialize Hive for Flutter
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductController(),
      child: GraphQLProvider(
        client: GraphqlConfict.initilizeClient(),
        child: CacheProvider(
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
