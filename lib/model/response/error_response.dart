
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse{
  @JsonKey(name: "message")
  String? message = "";

  @JsonKey(name: "error")
  String? error = "";

  @JsonKey(name: "code")
  int? code = 0;

  ErrorResponse({this.message, this.error, this.code});

  factory ErrorResponse.fromJson(Map<String, dynamic> map) => _$ErrorResponseFromJson(map);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}