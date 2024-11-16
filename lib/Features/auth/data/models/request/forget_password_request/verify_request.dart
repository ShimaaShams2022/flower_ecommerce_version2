
import 'package:json_annotation/json_annotation.dart';
part 'verify_request.g.dart';

@JsonSerializable()

class VerifyRequest {
  VerifyRequest({
    this.otp,});

  factory VerifyRequest.fromJson(Map<String, dynamic> json) => _$VerifyRequestFromJson(json);

  String? otp;

  Map<String, dynamic> toJson() => _$VerifyRequestToJson(this);

}