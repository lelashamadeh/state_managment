
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:repositorybloc/bolc/product_bloc.dart';
import 'package:repositorybloc/bolc/product_event.dart';
import 'package:repositorybloc/repository/product_repository.dart';
import 'package:repositorybloc/service/product_service.dart';
import 'package:repositorybloc/view/product_details.dart';
import 'package:repositorybloc/view/product_page.dart';


void main() {
  final dio = Dio();
  final productService = ProductService(dio: dio);
  final productRepository = ProductRepository(
    service: productService,
  );

  runApp(
    RepositoryProvider<ProductRepository>.value(
      value: productRepository,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => ProductBloc(
                repository: RepositoryProvider.of<ProductRepository>(context),
              )..add(LoadProducts()),
              child: ProductPage(),
            ),
        '/details': (context) => ProductDetailsPage(),
      },
    );
  }
}