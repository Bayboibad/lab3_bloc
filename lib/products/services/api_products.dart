import 'package:dio/dio.dart';
import 'package:lab3/products/models/producs.dart';

class ApiProduct {
  Future<List<Products>> getAll(int count) async {
    // ignore: unused_local_variable, unnecessary_brace_in_string_interps
    var response =
        // ignore: unnecessary_brace_in_string_interps
        await Dio().get("https://dummyjson.com/products?limit=${count}");
    if (response.statusCode == 200) {
      final json = response.data["products"] as List;
      final result = json.map((e) => Products(
          id: e['id'],
          title: e['title'],
          description: e['description'],
          price: e['price'],
          thumbnail: e['thumbnail'])
          ).toList();
          return result;
    }else{
      throw "Lỗi";
    }
  }
  
}
