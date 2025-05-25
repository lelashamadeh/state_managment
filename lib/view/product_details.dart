

import 'package:flutter/material.dart';
import 'package:repositorybloc/model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${product.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Quantity: ${product.quantity}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Price: \$${product.price}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
