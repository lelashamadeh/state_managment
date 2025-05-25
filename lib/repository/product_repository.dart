
//import 'package:repositorybloc/cache/product_cache.dart';
import 'package:repositorybloc/model/product_model.dart';
import 'package:repositorybloc/service/product_service.dart';

class ProductRepository {
  final ProductService service;

  List<ProductModel>? cachedProducts;

  ProductRepository({
    required this.service,
    
  });

  Future<List<ProductModel>> getProducts({bool forceRefresh =false}) async{
    if (cachedProducts!= null && !forceRefresh) {
      return cachedProducts!;
    }
    final products = await service.fetchProduct();
    cachedProducts = products;
    return products;
  }
}