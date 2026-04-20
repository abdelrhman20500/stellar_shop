import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/utils/errors/failure.dart';
import 'package:stellar_shop/Features/Auth/data/model/login_model.dart';
import 'package:stellar_shop/Features/Auth/domain/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  Future<Either<Failure, LoginModel>> call({required String email,required String password}) async {
    return await authRepo.userLogin(email: email, password: password);
  }
}
