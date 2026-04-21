import 'package:stellar_shop/Features/home/data/model/product_details_model.dart';

abstract class ProductDetailsState{}
class ProductDetailsInitial extends ProductDetailsState{}
class ProductDetailsLoading extends ProductDetailsState{}
class ProductDetailsFailure extends ProductDetailsState{
  final String errMessage;
  ProductDetailsFailure({required this.errMessage});
}
class ProductDetailsSuccess extends ProductDetailsState{
  final ProductDetails productDetails;
  ProductDetailsSuccess({required this.productDetails});
}

