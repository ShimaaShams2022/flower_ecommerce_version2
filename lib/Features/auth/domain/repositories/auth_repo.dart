
import '../../../../core/common/api_result.dart';

import '../entities/forget_password_entity.dart';
import '../entities/register_entities.dart';
import '../entities/verify_password_entity.dart';


abstract class AuthRepo {

  Future<Result<RegisterEntities?>> register(

    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
    String gender,
  );
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);

  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
}
