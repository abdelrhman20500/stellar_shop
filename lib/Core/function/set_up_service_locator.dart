// import 'package:dio/dio.dart';
//
//
// final getIt = GetIt.instance;
//
// void setUpServiceLocator() {
//   getIt.registerSingleton<ApiService>(ApiService(Dio()));
//
//
//   getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService: getIt.get<ApiService>()));
//   getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
//       homeBaseRemoteDataSource:
//           HomeRemoteDataSource(apiService: getIt.get<ApiService>())));
//   getIt.registerSingleton<ProductRepoImpl>(ProductRepoImpl(
//       productRemoteDataSource:ProductRemoteDataSource(apiService: getIt.get<ApiService>())));
//   getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(
//       cartRemoteDataSource: CartRemoteDataSource(apiService: getIt.get<ApiService>())));
// }
