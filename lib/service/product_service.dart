
import 'package:dio/dio.dart';
import 'package:repositorybloc/model/product_model.dart';

class ProductService {
   Dio dio ;
   final String baseUrl="https://680672a0e81df7060eb72e91.mockapi.io/products";

   ProductService({required this.dio});

   Future<List<ProductModel>> fetchProduct() async{
    try {
      final response =await dio.get(baseUrl);
      
      if (response.statusCode == 200) {
        final data =response.data as List;
        return data.map((jeson) =>ProductModel.fromJson(jeson)).toList();
      } else {
        throw Exception('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Dio error: $e');
    }
   }
   
  
}