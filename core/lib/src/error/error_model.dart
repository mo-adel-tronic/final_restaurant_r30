import 'package:core/src/api/end_points.dart';

class ErrorModel {
  final int status;
  final String message;

  ErrorModel({required this.status, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKeys.status],
      message: json[ApiKeys.message],
    );
  }
}
