
import '../../../../core/common/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/register_entities.dart';
import '../../domain/entities/verify_password_entity.dart';
import '../models/request/RegisterModelDto.dart';

abstract class AuthOnLineDataSource {
  Future<Result<RegisterEntities?>> register(RegisterModelDto registerModelDto);
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
}
