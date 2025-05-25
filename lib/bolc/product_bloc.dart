
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositorybloc/bolc/product_event.dart';
import 'package:repositorybloc/bolc/product_state.dart';
import 'package:repositorybloc/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent ,ProductState> {

  final ProductRepository repository;

  ProductBloc({required this.repository}):super(ProducyInitial()){
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }

    },);
  }
  
}