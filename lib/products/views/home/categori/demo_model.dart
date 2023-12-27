import 'package:flutter/material.dart';


class DemoModel extends StatefulWidget {
  const DemoModel({super.key});

  @override
  State<DemoModel> createState() => _DemoModelState();
}

class _DemoModelState extends State<DemoModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Các sản phẩm có giá dưới 500"),
      ),
      body: Container(
        //child: Text("${products.length}"),
        // child: ListView.builder(
        //   itemCount: products.length,
        //   itemBuilder: (context, index) {
        //     int id = products[index].id;
        //     String title = products[index].title;
        //     int price = products[index].price;
        //     String images =products[index].thumbnail;
        //     if (price! <= 500) {
        //       // ignore: avoid_unnecessary_containers
        //       return Container(
        //         child: ItemProduct(
        //             id: id,
        //             title: title,
        //             price: price,
        //             images: images,
        //             context: context),
        //       );
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),
      ),
    );
  }
}
