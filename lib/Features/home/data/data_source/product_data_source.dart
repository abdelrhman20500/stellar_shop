import 'package:stellar_shop/Features/home/data/model/product_model.dart';
import '../../../../Core/function/api_service.dart';
import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';
import '../model/product_details_model.dart';

abstract class ProductBaseRemoteDataSource {
  Future<ProductModel> getProductData();
  Future<ProductDetails> productId({required String productId});

}

class ProductRemoteDataSource extends ProductBaseRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSource({required this.apiService});

  @override
  Future<ProductModel> getProductData() async {
    var response = await apiService.get(endpoint: "products",);
    if (response.statusCode == 200) {
      final productModel = ProductModel.fromJson(response.data);
      return productModel;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductDetails> productId({required String productId})async{
    var response = await apiService.get(endpoint: "products/$productId");
    if (response.statusCode == 200) {
      final productDetailsModel = ProductDetails.fromJson(response.data);
      print('✅ Product Details:');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('ID: ${productDetailsModel.id}');
      print('Name: ${productDetailsModel.name}');
      print('Price: \$${productDetailsModel.price}');
      print('Stock: ${productDetailsModel.stock}');
      print('Rating: ${productDetailsModel.rating}');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return productDetailsModel;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
