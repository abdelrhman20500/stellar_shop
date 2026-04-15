import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Core/utils/errors/failure.dart';
import 'package:stellar_shop/Features/Auth/data/model/register_model.dart';
import 'package:stellar_shop/Features/Auth/domain/repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);

  Future<Either<Failure, RegisterModel>> call(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    return await authRepo.userRegister(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
  }
}
