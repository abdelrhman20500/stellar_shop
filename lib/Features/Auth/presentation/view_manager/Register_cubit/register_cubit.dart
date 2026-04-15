import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Features/Auth/presentation/view_manager/Register_cubit/register_state.dart';
import '../../../domain/use_case/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  Future<void> register(
      String firstName, String lastName, String email, String password) async {
    emit(RegisterLoading());
    final result = await registerUseCase.call(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    result.fold((failure) {
      emit(RegisterFailure(error: failure.message));
    }, (registerModel) {
      emit(RegisterSuccess(registerModel: registerModel));
    });
  }
}
