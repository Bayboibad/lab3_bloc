import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab3/products/views/home/bloc/product_bloc.dart';
import 'package:lab3/products/views/home/bloc/product_state.dart';
import 'package:lab3/products/views/home/categori/product_499.dart';
import 'package:lab3/products/views/home/categori/product_501.dart';

class CategorisTab extends StatefulWidget {
  const CategorisTab({super.key});

  @override
  State<CategorisTab> createState() => _CategorisTabState();
}

class _CategorisTabState extends State<CategorisTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Mục"),
        automaticallyImplyLeading: false,
      ),
      // ignore: avoid_unnecessary_containers
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (BuildContext context,ProductState state) {
          if (state is ResponseProductState) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product499(
                                  products: state.products,
                                )));
                  },
                  child: boderOrang(context, "Sản phẩm có giá dưới 500"),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product501(
                                  products: state.products,
                                )));
                  },
                  child: boderOrang(context, "Sản phẩm có giá trên 500"),
                ),
              ]),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget boderOrang(BuildContext context, String title) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    decoration: BoxDecoration(
        color: Colors.orange.shade900, borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Center(
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
