import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Features/Auth/data/model/register_model.dart';
import '../../../../Core/utils/errors/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,RegisterModel>> userRegister({required String firstName, required String lastName,
    required String email, required String password});
  Future<Either<Failure,String>> userOtp({required String email, required String otp});
}