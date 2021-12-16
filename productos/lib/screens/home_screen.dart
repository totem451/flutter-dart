import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lib/models/models.dart';
import 'package:lib/screens/screens.dart';

import 'package:lib/services/services.dart';
import 'package:lib/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Productos'),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.login_outlined)),
          actions: [
            IconButton(
                onPressed: () {
                  authService.logout();
                  Navigator.pushReplacementNamed(context, 'login');
                },
                icon: Icon(Icons.login_outlined)),
          ]),
      body: ListView.builder(
          itemCount: productsService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  productsService.selectedProduct =
                      productsService.products[index].copy();
                  Navigator.pushNamed(context, 'product');
                },
                child: ProductCard(
                  product: productsService.products[index],
                ),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct =
              new Product(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
