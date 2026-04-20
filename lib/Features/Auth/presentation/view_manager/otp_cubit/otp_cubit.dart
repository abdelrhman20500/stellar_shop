import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Features/Auth/domain/use_case/otp_use_case.dart';
import 'package:stellar_shop/Features/Auth/presentation/view_manager/otp_cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.otpUseCase) : super(OtpInitial());
  final OtpUseCase otpUseCase;
  Future<void> otp(String email, String otp) async {
    emit(OtpLoading());
    final result = await otpUseCase.call(email: email, otp: otp);
    result.fold((failure) {
      emit(OtpFailure(error: failure.message));
    }, (response) {
      emit(OtpSuccess(response: response));
    });
  }
}
