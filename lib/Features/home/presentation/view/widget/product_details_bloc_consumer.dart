import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Core/function/api_service.dart';
import 'package:stellar_shop/Features/home/data/data_source/product_data_source.dart';
import 'package:stellar_shop/Features/home/data/repo/product_repo_impl.dart';
import 'package:stellar_shop/Features/home/presentation/view_manager/product_details_cubit/product_details_cubit.dart';
import '../../../domain/use_case/product_details_use_case.dart';
import '../../view_manager/product_details_cubit/product_details_state.dart';
import '../product_details.dart';

class ProductDetailsBlocConsumer extends StatelessWidget {
  const ProductDetailsBlocConsumer({super.key, this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => ProductDetailsCubit(ProductDetailsUseCase(
            ProductRepoImpl(productBaseRemoteDataSource:
            ProductRemoteDataSource(apiService: ApiService(Dio(),),),),),)..productId(id: productId!),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsFailure) {
                return Center(child: Text(state.errMessage));
              } else if (state is ProductDetailsSuccess) {
                return ProductDetailsScreen(
                  image: state.productDetails.coverPictureUrl!,
                  name: state.productDetails.name!,
                  description: state.productDetails.description!,
                  price: state.productDetails.price!.toDouble().toString(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
      ),
      );
  }
}
