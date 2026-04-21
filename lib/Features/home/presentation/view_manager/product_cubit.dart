import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Features/home/domain/use_case/product_use_case.dart';
import '../../../../Core/base_use_case/base_use_case.dart';
import 'product_state.dart';


class ProductCubit extends Cubit<ProductState>{
  ProductCubit(this.productUseCase): super(ProductInitial());
  final ProductUseCase productUseCase;

  Future<void> product() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productModel) {
      emit(ProductSuccess(productModel: productModel));
    });
  }
}