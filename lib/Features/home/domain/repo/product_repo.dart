import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/utils/errors/failure.dart';
import 'package:stellar_shop/Features/home/data/model/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductModel>> fetchProduct();}
