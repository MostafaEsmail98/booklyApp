import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures(this.errMessage);
}

class ServicesError extends Failures {
  ServicesError(super.errMessage);

  factory ServicesError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServicesError("Connection Time Out");
      case DioExceptionType.sendTimeout:
        return ServicesError("Send Time Out");
      case DioExceptionType.receiveTimeout:
        return ServicesError("Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServicesError("Connection Time Out");
      case DioExceptionType.badResponse:
       return ServicesError.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServicesError("Request to Api with cancel");
      case DioExceptionType.connectionError:
        return ServicesError("Error of Connection");
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")){
          return ServicesError("No Internet Connection");
        }
    }
    return ServicesError(dioError.toString());
  }

  factory ServicesError.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServicesError(response["error"]["message"]);
    } else if (statusCode == 500) {
      return ServicesError("Check you Internet");
    } else if (statusCode == 404) {
     return ServicesError("Method not found");
    }
    return ServicesError("Opps , Try again");
  }
}
