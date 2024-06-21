import 'dart:developer';

class CustomException implements Exception {
  final String message;

  CustomException(this.message) {
    log('$runtimeType: $message');
  }

  @override
  String toString() => message;
}

class BussinessException extends CustomException {
  BussinessException(super.message);
}

class ControllerException extends CustomException {
  ControllerException(super.message);
}

class ServiceException extends CustomException {
  ServiceException(super.message);
}
