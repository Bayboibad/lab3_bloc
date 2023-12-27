import 'package:bloc/bloc.dart';
import 'package:lab3/products/views/home/bloc/product_state.dart';
import 'package:lab3/products/services/api_products.dart';

class ProductCubit extends Cubit<ProductState>{
   final ApiProduct _api;
  ProductCubit(this._api):super(InitProductState());

  Future<void> fetchPro(int count) async {
    emit(LoadingState());
    try{
      final response = await _api.getAll(count);
      emit(ResponseProductState(response));
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }

}