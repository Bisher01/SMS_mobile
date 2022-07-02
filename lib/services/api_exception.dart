class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String ?message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String ?message]) : super(message, "Invalid Input: ");
}

class RequestWasCancelledException extends AppException {
  RequestWasCancelledException([String ?message])
      : super(message, "Request was cancelled: ");
}

class ConnectionTimeout extends AppException {
  ConnectionTimeout([String ?message]) : super(message, "Connection timeout: ");
}

class DefaultTimeout extends AppException {
  DefaultTimeout([String ?message]) : super(message, "Default timeout: ");
}

class ReceiveTimeout extends AppException {
  ReceiveTimeout([String ?message])
      : super(message, "Receive timeout in connection: ");
}

class SendTimeout extends AppException {
  SendTimeout([String ?message])
      : super(message, "Receive timeout in send request: ");
}
