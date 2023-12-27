import 'package:flutter/material.dart';
import 'package:lab3/products/models/producs.dart';
import 'package:lab3/products/widgets/item_product.dart';

// ignore: must_be_immutable
class Product501 extends StatefulWidget {
  List<Products> products;
  Product501({super.key, required this.products});

  @override
  State<Product501> createState() => _Product501State();
}

class _Product501State extends State<Product501> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sản phẩm có giá trên 500")),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final data = widget.products[index];
            if (data.price >= 500) {
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
          },
        ),
      ),
    );
  }
}
