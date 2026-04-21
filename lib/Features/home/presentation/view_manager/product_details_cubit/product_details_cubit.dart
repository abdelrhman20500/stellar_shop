import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Features/home/domain/use_case/product_details_use_case.dart';
import 'product_details_state.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  ProductDetailsCubit(this.productDetailsUseCase): super(ProductDetailsInitial());
  final ProductDetailsUseCase productDetailsUseCase;

  Future<void> productId({required String id}) async {
    emit(ProductDetailsLoading());
    var result = await productDetailsUseCase.call(id);
    result.fold((e) {
      emit(ProductDetailsFailure(errMessage: e.message));
    }, (productDetails) {
      emit(ProductDetailsSuccess(productDetails: productDetails));
    });
  }
}