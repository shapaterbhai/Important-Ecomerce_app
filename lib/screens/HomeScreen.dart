import 'package:flutter/material.dart';

class EcommerceCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Card App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EcommerceCardScreen(),
    );
  }
}

class EcommerceCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce Card App'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return EcommerceCard(product: products[index]);
        },
      ),
    );
  }
}

class EcommerceCard extends StatelessWidget {
  final Product product;

  EcommerceCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Add to cart logic
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String description;
  final double price;

  Product({
    required this.title,
    required this.description,
    required this.price,
  });
}

List<Product> products = [
  Product(
    title: 'Product 1',
    description: 'This is product 1 description',
    price: 9.99,
  ),
  Product(
    title: 'Product 2',
    description: 'This is product 2 description',
    price: 14.99,
  ),
  Product(
    title: 'Product 3',
    description: 'This is product 3 description',
    price: 19.99,
  ),
];
