import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_shop/Core/function/api_service.dart';
import 'package:stellar_shop/Features/home/data/data_source/product_data_source.dart';
import 'package:stellar_shop/Features/home/data/repo/product_repo_impl.dart';
import 'package:stellar_shop/Features/home/domain/use_case/product_details_use_case.dart';
import 'package:stellar_shop/Features/home/presentation/view_manager/product_details_cubit/product_details_cubit.dart';
import 'Features/layout/presentation/view/layout_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ProductDetailsCubit(ProductDetailsUseCase(ProductRepoImpl(productBaseRemoteDataSource: 
  ProductRemoteDataSource(apiService: ApiService(Dio(),),),),),)..productId(id: "7d6952ad-34a2-46b8-a228-9ee138b2e0dd");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );
  }
}
