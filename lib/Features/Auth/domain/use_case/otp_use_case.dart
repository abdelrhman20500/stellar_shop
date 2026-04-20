import 'package:dartz/dartz.dart';
import 'package:stellar_shop/Features/Auth/domain/repo/auth_repo.dart';

import '../../../../Core/utils/errors/failure.dart';

class OtpUseCase {
  final AuthRepo authRepo;

  OtpUseCase(this.authRepo);
  Future<Either<Failure, String>> call(
      {required String email, required String otp}) async {
    return await authRepo.userOtp(email: email, otp: otp);
  }
}
