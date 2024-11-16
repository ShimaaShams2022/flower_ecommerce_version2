
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';

import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/register_entities.dart';
import '../../domain/entities/verify_password_entity.dart';
import '../data_sources/auth_online_datasource.dart';
import '../models/request/RegisterModelDto.dart';
import '../models/request/forget_password_request/forget_password_request.dart';
import '../models/request/forget_password_request/verify_request.dart';

@Injectable(as: AuthOnLineDataSource)
class AuthOnLineDataSourceImpl implements AuthOnLineDataSource {
  final ApiService _authRetrofit;

  AuthOnLineDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<RegisterEntities?>> register(
      RegisterModelDto registerModelDto) {
    return executeApi(() async {
      var response = await _authRetrofit.signUp(registerModelDto);
      return response.toRegisterEntities();
    });
  }

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email ) {
    ForgetPasswordRequest requestEmail=ForgetPasswordRequest(email: email);
    return executeApi(() async {
      var response = await _authRetrofit.forgetPassword(requestEmail);
      return response.toForgetPasswordEntity();
    });
  }


  @override
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp ) {
    VerifyRequest requestOtp=VerifyRequest(resetCode: otp);
    return executeApi(() async {
      var response = await _authRetrofit.verifyPassword(requestOtp);
      return response.toVerifyPasswordEntity();
    });
  }
}
