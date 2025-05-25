
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositorybloc/bolc/product_bloc.dart';
import 'package:repositorybloc/bolc/product_state.dart';


class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, '/details',arguments: product);
                  },
                  title: Text(product.name),
                  subtitle: Text('Qty: ${product.quantity} - Price: \$${product.price}'),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('Press to load products'));
        },
      ),
    );
  }
}
