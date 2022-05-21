import 'dart:io';

import 'package:local_data_source/core/error/failure.dart';

enum StatusCodes {
  statusCode200,
  statusCode400,
  statusCode401,
  statusCode404,
  statusCode500,
  statusCode504,
}

extension StatusCodesExtension on StatusCodes {
  int get getStatusCode {
    switch (this) {
      case StatusCodes.statusCode200:
        return HttpStatus.ok;
      case StatusCodes.statusCode400:
        return HttpStatus.badRequest;
      case StatusCodes.statusCode401:
        return HttpStatus.unauthorized;
      case StatusCodes.statusCode404:
        return HttpStatus.notFound;
      case StatusCodes.statusCode500:
        return HttpStatus.internalServerError;
      case StatusCodes.statusCode504:
        return HttpStatus.gatewayTimeout;
    }
  }

  Failure getFailure(int statusCode) {
    switch (statusCode) {
      case HttpStatus.badRequest:
        return BadRequestFailure();
      case HttpStatus.unauthorized:
        return UnauthorizedFailure();
      case HttpStatus.notFound:
        return NotFoundFailure();
      case HttpStatus.internalServerError:
        return InternalFailure();
      case HttpStatus.gatewayTimeout:
        return GatewayTimeOutFailure();
      default:
        //TODO: Change failure type.
        return NotFoundFailure();
    }
  }
}
