import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Core/function/api_service.dart';
import 'package:stellar_shop/Features/home/data/data_source/product_data_source.dart';
import 'package:stellar_shop/Features/home/data/repo/product_repo_impl.dart';
import 'package:stellar_shop/Features/home/domain/use_case/product_use_case.dart';
import 'package:stellar_shop/Features/home/presentation/view/widget/product_grid_view.dart';
import 'package:stellar_shop/Features/home/presentation/view_manager/product_cubit.dart';
import 'package:stellar_shop/Features/home/presentation/view_manager/product_state.dart';


class ProductBlocConsumer extends StatelessWidget {
  const ProductBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductUseCase(ProductRepoImpl(
          productBaseRemoteDataSource: ProductRemoteDataSource(apiService:
          ApiService(Dio(),),),),),)..product(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if(state is ProductLoading)
            {
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is ProductSuccess){
            return ProductGridView(model: state.productModel);
          }else{
            return const Center(child: Text("No Product available"));
          }
        },
      ),
    );
  }
}
