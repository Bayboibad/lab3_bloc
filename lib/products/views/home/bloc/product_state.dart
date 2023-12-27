import 'package:lab3/products/models/producs.dart';

abstract class ProductState {}
class InitProductState extends ProductState{}
class LoadingState extends ProductState{}
class ErrorState extends ProductState{}
class ResponseProductState extends ProductState{
    List<Products> products;
    ResponseProductState(this.products);
}