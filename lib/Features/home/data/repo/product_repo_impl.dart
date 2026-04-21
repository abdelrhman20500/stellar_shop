import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/utils/errors/failure.dart';
import 'package:stellar_shop/Features/home/data/data_source/product_data_source.dart';
import 'package:stellar_shop/Features/home/data/model/product_model.dart';
import 'package:stellar_shop/Features/home/domain/repo/product_repo.dart';

import '../../../../Core/utils/errors/exception.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductBaseRemoteDataSource productBaseRemoteDataSource;

  ProductRepoImpl({required this.productBaseRemoteDataSource});

  @override
  Future<Either<Failure, ProductModel>> fetchProduct()async{
    try {
      final result = await productBaseRemoteDataSource.getProductData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}