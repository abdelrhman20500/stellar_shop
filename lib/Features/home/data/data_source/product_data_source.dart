import 'package:stellar_shop/Features/home/data/model/product_model.dart';
import '../../../../Core/function/api_service.dart';
import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/exception.dart';

abstract class ProductBaseRemoteDataSource {
  Future<ProductModel> getProductData();
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
}
