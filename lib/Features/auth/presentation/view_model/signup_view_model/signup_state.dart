
import '../../../domain/entities/register_entities.dart';

sealed class RegisterState {}

class InitialState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterEntities? registerEntities;

  SuccessRegisterState(this.registerEntities);
}

class LoadingRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  Exception? exception;

  ErrorRegisterState(this.exception);
}
