import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/base_use_case/base_use_case.dart';
import 'package:stellar_shop/Features/home/data/model/product_model.dart';

import '../../../../Core/utils/errors/failure.dart';
import '../repo/product_repo.dart';

class ProductUseCase extends BaseUseCase<ProductModel, NoParameters>{
  final ProductRepo productRepo;

  ProductUseCase(this.productRepo);

  @override
  Future<Either<Failure, ProductModel>> call([NoParameters? param]) async{
    return await productRepo.fetchProduct();
  }
}