import 'dart:async';
import '/core/network/api_result/api_result.dart';
import '/core/network/base/network_exceptions/network_exceptions.dart';
import '/core/network/base/typedef/typedef.dart';

// Define ApiResult and NetworkExceptions if not already defined
ResultFuture<T> executeAndHandleError<T>(Future<T> Function() function) async {
  try {
    final response = await function();
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(NetworkExceptions.getDioException(error));
  }
}
