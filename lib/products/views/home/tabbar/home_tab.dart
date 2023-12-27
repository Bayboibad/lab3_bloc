// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab3/products/views/home/bloc/product_bloc.dart';
import 'package:lab3/products/views/home/bloc/product_state.dart';
import 'package:lab3/products/widgets/item_product.dart';
import 'package:loadmore/loadmore.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var count = 10;
  @override
  void initState() {
    super.initState();
    fetchData();
   
  }
  fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final response = context.read<ProductCubit>();
      response.fetchPro(count);
       count += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (BuildContext context, ProductState state) {
          if(state is InitProductState || state is LoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is ResponseProductState){
            final products = state.products;
            return RefreshIndicator(
            onRefresh: _refresh,
            child: LoadMore(
              isFinish: products.length >= 10,
              onLoadMore: _loadMore,
              whenEmptyLoad: true,
              delegate: const DefaultLoadMoreDelegate(),
              textBuilder: DefaultLoadMoreTextBuilder.chinese,
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: ListView.builder(
                  itemCount: products.length,
                  // ignore: avoid_unnecessary_containers
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      
                    },
                    child: ItemProduct(
                        id: products[index].id,
                        title: products[index].title,
                        price: products[index].price,
                        images: products[index].thumbnail,
                        context: context),
                  ),
                ),
              ),
            ),
          );
          }
          return Center( child: Text(state.toString()),);
          
        },
      ),
    );
  }

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    fetchData();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    fetchData();
  }
}
