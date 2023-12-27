import 'package:flutter/material.dart';
import 'package:lab3/products/models/producs.dart';
import 'package:lab3/products/widgets/item_product.dart';

// ignore: must_be_immutable
class Product499 extends StatefulWidget {
  List<Products> products;
  Product499({super.key, required this.products});

  @override
  State<Product499> createState() => _Product499State();
}

class _Product499State extends State<Product499> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Các sản phẩm có giá dưới 500"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
            itemCount: widget.products.length,
            // ignore: avoid_unnecessary_containers
            itemBuilder: (context, index) {
              final data = widget.products[index];
              if (data.price < 500) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  child: ItemProduct(
                      id: data.id,
                      title: data.title,
                      price: data.price,
                      images: data.thumbnail,
                      context: context),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
