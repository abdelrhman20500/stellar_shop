import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/base_use_case/base_use_case.dart';
import 'package:stellar_shop/Features/home/data/model/product_details_model.dart';
import 'package:stellar_shop/Features/home/domain/repo/product_repo.dart';
import '../../../../Core/utils/errors/failure.dart';

class ProductDetailsUseCase extends BaseUseCase<ProductDetails, String> {
  final ProductRepo productRepo;

  ProductDetailsUseCase(this.productRepo);

  @override
  Future<Either<Failure, ProductDetails>> call([String? productId]) async {
    return await productRepo.productId(id: productId!);
  }
}
