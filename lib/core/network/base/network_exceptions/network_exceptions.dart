// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:home/new_app/data/extensions.dart';
import '/core/consts/app_strings.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@Freezed()
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest(String reason) = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 401:
        return NetworkExceptions.unauthorizedRequest(getResMessage(response));
      case 400:
        // case 403:
        return NetworkExceptions.badRequest(getResMessage(response));
      case 404:
        return NetworkExceptions.notFound(getResMessage(response));
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 422:
        return NetworkExceptions.unprocessableEntity(getResMessage(response));
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        ("Received invalid status code: $statusCode").printy();
        return NetworkExceptions.defaultError(KStrings.somethingWrong.tr);
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          networkExceptions = _dioError(error);
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      ("Error ====> $error").printy();
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getResMessage(Response? response) {
    List<String> errors = [];
    if (response != null) {
      {
        var res =
            response.data is Map ? response.data : json.decode(response.data);
        ("$res").printy();
        ("res is Map >>>>>>> ${res is Map}").printy();
        ("res is String >>>>>>> ${res is String}").printy();

        if (res is Map) {
          if (res.containsKey("password1")) {
            errors.add((res["password1"] as List).first);
          } else {
            (res).forEach((k, v) {
              var value = (v is List) ? v.first : v;
              var key = "$k".contains("password1") ? "$k : " : "";
              var error = (k == "message" || k == "detail")
                  ? "$value\n"
                  : "$key$value\n";
              errors.add(error);
            });
          }
        } else {
          errors.add(res.toString().valide());
        }
      }
    }

    String error = errors
        .toString()
        .replaceAll("}", "")
        .replaceAll("{", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll("'", "")
        .replaceAll('"', "")
        .replaceAll(",", "")
        .trim();

    return error;
  }

  static NetworkExceptions _dioError(DioException error) =>
      switch (error.type) {
        DioExceptionType.cancel => const NetworkExceptions.requestCancelled(),
        DioExceptionType.connectionTimeout =>
          const NetworkExceptions.requestTimeout(),
        DioExceptionType.receiveTimeout =>
          const NetworkExceptions.sendTimeout(),
        DioExceptionType.connectionError =>
          const NetworkExceptions.noInternetConnection(),
        DioExceptionType.badResponse =>
          NetworkExceptions.handleResponse(error.response),
        DioExceptionType.sendTimeout => const NetworkExceptions.sendTimeout(),
        // DioExceptionType.badCertificate => const NetworkExceptions.badRequest(error.response),
        // DioExceptionType.badResponse => throw UnimplementedError(),
        _ => const NetworkExceptions.defaultError(KStrings.somethingWrong),
      };

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    String errorMessage = "";
    networkExceptions.when(
      notImplemented: () => errorMessage = "notImplemented".tr,
      requestCancelled: () => errorMessage = "requestCancelled".tr,
      internalServerError: () => errorMessage = "internalServerError".tr,
      // notFound: (String error) => errorMessage = error;,
      notFound: (String error) => errorMessage = error,
      serviceUnavailable: () => errorMessage = "serviceUnavailable".tr,
      methodNotAllowed: () => errorMessage = "methodNotAllowed".tr,
      badRequest: (String error) => errorMessage = error,
      unauthorizedRequest: (String reason) => errorMessage = reason,
      unprocessableEntity: (String error) => errorMessage = error,
      unexpectedError: () => errorMessage = "unexpectedError".tr,
      requestTimeout: () => errorMessage = "requestTimeout".tr,
      noInternetConnection: () => errorMessage = "noInternetConnection".tr,
      conflict: () => errorMessage = "conflict".tr,
      sendTimeout: () => errorMessage = "sendTimeout".tr,
      unableToProcess: () => errorMessage = "unableToProcess".tr,
      defaultError: (String error) => errorMessage = error.tr,
      formatException: () => errorMessage = "formatException".tr,
      notAcceptable: () => errorMessage = "notAcceptable".tr,
    );

    return errorMessage;
  }
}
