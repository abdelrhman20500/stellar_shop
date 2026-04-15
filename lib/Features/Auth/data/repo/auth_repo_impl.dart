import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/function/api_service.dart';
import 'package:stellar_shop/Core/utils/errors/failure.dart';
import 'package:stellar_shop/Features/Auth/data/model/register_model.dart';
import 'package:stellar_shop/Features/Auth/domain/repo/auth_repo.dart';

import '../../../../Core/utils/errors/error_message_model.dart';

class AuthRepoImpl extends AuthRepo{

  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, RegisterModel>> userRegister({required String firstName,
    required String lastName, required String email, required String password})async{
    var response = await apiService.post("auth/register", {
      "firstName":firstName,
      "lastName":lastName,
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final registerModel = RegisterModel.fromJson(response.data);
      print(registerModel.message);
      return Right(registerModel);
    } else {
      final errorModel = ErrorMessageModel.fromJson(response.data);
      return Left(ServerFailure(errorModel.message));
    }
  }

}