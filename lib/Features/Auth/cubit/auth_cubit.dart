import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_state.dart';
import 'package:e_commerce_app/Features/Auth/model/login_response_model.dart';
import 'package:e_commerce_app/Features/Auth/model/register_response_model.dart';
import 'package:e_commerce_app/Features/Auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this._authRepo}) : super(AuthInitial());
  final AuthRepo _authRepo;
  void login({required String email, required String password}) async {
    emit(AuthLoading());
    final Either<String, LoginResponseModel> res = await _authRepo.login(
      email,
      password,
    );
    res.fold(
      (error) => emit(AuthError(error)),
      (right) => emit(AuthSuccess("Login successfully")),
    );
  }

  void register(
    String avatar, {
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    final Either<String, RegisterResponseModel> res = await _authRepo.register(
      avatar: avatar,
      email: email,
      password: password,
      name: name,
    );
    res.fold(
      (error) => emit(AuthError(error)),
      (right) => emit(AuthSuccess("Register successfully")),
    );
  }
}
