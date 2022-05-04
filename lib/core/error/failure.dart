abstract class Failure {}

//! General Failures
class NullPointerFailure implements Failure {}

class ListEmptyFailure implements Failure {}

class UserNotFoundFailure implements Failure {}

//! Base Response Status Failures
class BadRequestFailure implements Failure {}

class UnauthorizedFailure implements Failure {}

class ForbiddenFailure implements Failure {}

class NotFoundFailure implements Failure {}

class InternalFailure implements Failure {}

class GatewayTimeOutFailure implements Failure {}

extension FailureExtension on Failure {
  String errorMessage() {
    switch (runtimeType) {
      case NullPointerFailure:
        return "Null Pointer Failure";
      case ListEmptyFailure:
        return "List Empty Failure";
      case UserNotFoundFailure:
        return "No user found with the entered information.";
      default:
        return "Failure";
    }
  }
}
